const jsonFile = "news.json"; // Path to JSON file

document.addEventListener("DOMContentLoaded", () => {
    fetchNews("general"); // Load general news by default
    loadSearchHistory(); // Load previous searches

    document.querySelectorAll(".category-link").forEach(link => {
        link.addEventListener("click", function (event) {
            event.preventDefault(); // Prevent page reload
            const category = this.getAttribute("data-category");
            updateBreakingNews(category);
            fetchNews(category);
        });
    });

    document.getElementById("searchButton").addEventListener("click", function () {
        performSearch();
    });

    document.getElementById("searchInput").addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            performSearch();
        }
    });
});

// ✅ Update Breaking News Section Based on Category
function updateBreakingNews(category) {
    const breakingNewsElement = document.getElementById("featured-news");
    breakingNewsElement.innerHTML = `<h2>${category.charAt(0).toUpperCase() + category.slice(1)} News</h2>`;
}

// ✅ Fetch News from JSON for Specific Category
function fetchNews(category) {
    fetch(jsonFile)
        .then(response => response.json())
        .then(data => {
            const newsContainer = document.getElementById("newsContainer");
            if (data.categories[category] && data.categories[category].length > 0) {
                displayNews(data.categories[category]);
            } else {
                newsContainer.innerHTML = "<p>No articles found in this category.</p>";
            }
        })
        .catch(error => console.error("Error loading JSON:", error));
}

// ✅ Function to Perform Search
function performSearch() {
    const query = document.getElementById("searchInput").value.trim().toLowerCase();
    if (query !== "") {
        fetchSearchResults(query);
        saveSearchHistory(query);
    }
}

// ✅ Function to Fetch Search Results from JSON
function fetchSearchResults(query) {
    fetch(jsonFile)
        .then(response => response.json())
        .then(data => {
            let results = [];
            Object.values(data.categories).forEach(articles => {
                results.push(...articles.filter(article =>
                    article.title.toLowerCase().includes(query) ||
                    (article.description && article.description.toLowerCase().includes(query))
                ));
            });

            if (results.length > 0) {
                displayNews(results);
            } else {
                document.getElementById("newsContainer").innerHTML = "<p>No matching articles found.</p>";
            }
        })
        .catch(error => console.error("Error loading search results:", error));
}

// ✅ Function to Save Search History
function saveSearchHistory(query) {
    let history = JSON.parse(localStorage.getItem("searchHistory")) || [];
    history.unshift(query);
    if (history.length > 5) history.pop(); // Limit to last 5 searches
    localStorage.setItem("searchHistory", JSON.stringify(history));
}

// ✅ Function to Load Search History
function loadSearchHistory() {
    let history = JSON.parse(localStorage.getItem("searchHistory")) || [];
    if (history.length > 0) {
        document.getElementById("searchInput").placeholder = `Recent: ${history.join(", ")}`;
    }
}

// ✅ Function to Display News Articles (with Comment Section)
function displayNews(articles) {
    const newsContainer = document.getElementById("newsContainer");
    newsContainer.innerHTML = ""; // Clear previous articles

    if (!articles || articles.length === 0) {
        newsContainer.innerHTML = "<p>No articles found.</p>";
        return;
    }

    articles.forEach(article => {
        const articleElement = document.createElement("div");
        articleElement.classList.add("news-article");

        let imageUrl = article.urlToImage || "https://via.placeholder.com/300x200?text=No+Image";

        articleElement.innerHTML = `
            <img src="${imageUrl}" alt="News Image" 
                 onerror="this.onerror=null;this.src='https://via.placeholder.com/300x200?text=No+Image';">
            <h3>${article.title}</h3>
            <p>${article.description || "No description available."}</p>
            <p><strong>By:</strong> ${article.author || "Unknown"} | <strong>Date:</strong> ${article.publishedAt}</p>
            <a href="${article.url}" target="_blank">Read More</a>

            <!-- ✅ Comment Section -->
            <div class="comment-section">
                <h4>Comments</h4>
                <textarea class="comment-input" placeholder="Write a comment..."></textarea>
                <button class="comment-btn">Post Comment</button>
                <div class="comments-list"></div>
            </div>

            <!-- ✅ Social Share -->
            <div class="social-share">
                <button class="facebook-btn" onclick="shareOnFacebook('${article.url}')">Share on Facebook</button>
                <button class="twitter-btn" onclick="shareOnTwitter('${article.url}')">Share on Twitter</button>
                <button class="whatsapp-btn" onclick="shareOnWhatsApp('${article.url}')">Share on WhatsApp</button>
            </div>
        `;

        newsContainer.appendChild(articleElement);
    });

    enableCommentSection();
}

// ✅ Function to Enable Comment Posting
function enableCommentSection() {
    document.querySelectorAll(".comment-btn").forEach(button => {
        button.addEventListener("click", function () {
            const commentInput = this.previousElementSibling;
            const commentText = commentInput.value.trim();
            if (commentText !== "") {
                const commentList = this.nextElementSibling;
                const newComment = document.createElement("p");
                newComment.textContent = commentText;
                commentList.appendChild(newComment);
                commentInput.value = "";
            }
        });
    });
}

// ✅ Social Media Sharing Functions
function shareOnFacebook(url) {
    window.open(`https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(url)}`, '_blank');
}

function shareOnTwitter(url) {
    window.open(`https://twitter.com/intent/tweet?url=${encodeURIComponent(url)}`, '_blank');
}

function shareOnWhatsApp(url) {
    window.open(`https://api.whatsapp.com/send?text=${encodeURIComponent(url)}`, '_blank');
}
