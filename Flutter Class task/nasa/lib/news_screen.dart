import 'package:flutter/material.dart';
import 'nasa_api_service.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<dynamic> news = [];

  @override
  void initState() {
    super.initState();
    fetchNasaNews();
  }

  void fetchNasaNews() async {
    try {
      final data = await NasaApiService.fetchNasaNews();
      setState(() {
        news = data;
      });
    } catch (e) {
      print("Error fetching news: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NASA News 📰")),
      body: news.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: news.length,
              itemBuilder: (context, index) {
                var article = news[index];
                String title = article['data'][0]['title'] ?? "No title available";
                String description = (article['data'][0]['description'] != null && article['data'][0]['description'].length > 100)
                    ? "${article['data'][0]['description'].substring(0, 100)}..." // Show short description
                    : "No description available";
                String imageUrl = article['links'] != null ? article['links'][0]['href'] : "https://via.placeholder.com/300";

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              "https://www.nasa.gov/sites/default/files/thumbnails/image/nasa-logo-web-rgb.png",
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              description,
                              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
