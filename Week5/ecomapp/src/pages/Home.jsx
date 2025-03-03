import { useState } from "react";
import ProductCard from "../components/ProductCard";

const products = [
  // 🖥 Electronics
  { id: 1, name: "Smartphone", price: 12590,category:"Electronics",image: "https://th.bing.com/th/id/OIP.0H_GXDBmj8t95s1KzMU5GAHaL5?w=149&h=220&c=7&r=0&o=5&dpr=1.3&pid=1.7"},
  { id: 2, name: "Laptop", price: 59999,category:"Electronics", image: "https://th.bing.com/th/id/R.394d42a12a654a01aff55a4ac589de48?rik=8meqYWp%2fRiAmDw&riu=http%3a%2f%2fstore.hp.com%2fUKStore%2fHtml%2fMerch%2fImages%2fc05475056_1750x1285.jpg&ehk=hFHW0bsoA4Vrq9NqTnBn9ZROJe9jXLuXOG2U%2bb2O7Wk%3d&risl=&pid=ImgRaw&r=0" },
  { id: 3, name: "Wireless Earbuds", price: 1500, category:"Electronics",image: "https://mm.jbl.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwbe525e1c/1.JBL_VIBE_WAVE_200TWS_Product%20Image_Hero_Blue.png" },
  { id: 4, name: "Smartwatch", price: 3280,category:"Electronics", image: "https://5.imimg.com/data5/SELLER/Default/2020/12/XD/PX/NZ/15119067/418ypqzo1sl-500x500.jpg" },
  
  // 👕 Fashion
  { id: 5, name: "Men's Shirt", price: 2100, category: "Fashion", image: "https://duders.in/cdn/shop/files/MenShirts_4.png?v=1702725005" },
  { id: 6, name: "Women's Kurta", price: 2999, category: "Fashion", image: "https://img.faballey.com/images/Product/RTN00119Z/d3.jpg" },
  { id: 7, name: "Saree", price: 3499, category: "Fashion", image: "https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/2024/AUGUST/5/EeSksI38_b42085c57fed4f2eb0327c608a9b03e1.jpg"},
  { id: 8, name: "Jean", price: 2890, category: "Fashion", image: "https://assets.ajio.com/medias/sys_master/root/20231013/HkdP/65294844afa4cf41f5413f19/-473Wx593H-466702830-grey-MODEL.jpg" },
  { id: 9, name: "Hoodie", price: 1799, category: "Fashion", image: "https://tearbird.com/wp-content/uploads/2024/10/3-1.png" },

  // 🏡 Home & Kitchen
  { id: 10, name: "Coffee Maker", price: 3999, category: "Home & Kitchen", image: "https://i5.walmartimages.com/asr/16f77040-27ab-4008-9852-59c900d7a7d9_1.c524f1d9c465e122596bf65f939c8d26.jpeg" },
  { id: 11, name: "Air Fryer", price: 5985, category: "Home & Kitchen", image: "https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6288/6288980ld.jpg" },
  { id: 12, name: "Microwave Oven", price: 9999, category: "Home & Kitchen", image: "https://th.bing.com/th/id/OIP.WOq4Lbn_Qx6d88xxdIigpAHaFe?rs=1&pid=ImgDetMain" },
  { id: 13, name: "Electric Kettle", price: 1490, category: "Home & Kitchen", image: "https://th.bing.com/th/id/OIP.VlLYfSFyg23qAkqHFEkLJQHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7" },

  // 🎁 Accessorie
  { id: 14, name: "Bangles", price: 850, category: "Accessories", image: "https://www.ijewels.co.in/cdn/shop/files/ADB157S_1_800x.jpg?v=1695037823" },
  { id: 15, name: "Hair Clips", price: 150, category: "Accessories", image: "https://5.imimg.com/data5/SELLER/Default/2024/10/459405981/PN/JC/PP/4320526/14pcs-card-clip-rubber-set-for-girls-7pcs-rubber-band-7pcs-clip-multi-color-500x500.jpg" },
  { id: 16, name: "Band", price: 450, category: "Accessories", image: "https://th.bing.com/th/id/OIP.rHeks0bAj5ig2YoDCE23xwHaHa?rs=1&pid=ImgDetMain" },

  // 📚 Stationery
  { id: 17, name: "Notebook", price: 250, category: "Stationery", image: "https://printblow.com/wp-content/uploads/2022/06/117FRONT-scaled-1.jpg" },
  { id: 18, name: "Pen Set", price: 150, category: "Stationery", image: "https://www.giftoo.in/cdn/shop/products/Untitleddesign-2023-11-22T105528.797.png?v=1710525486" },
  { id: 19, name: "School Bag", price: 1999, category: "Stationery", image: "https://m.media-amazon.com/images/I/41oqUhfvZNL.AC_UY1100.jpg" },
  { id: 20, name: "Pouch", price: 299, category: "Stationery", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmqjqtp9Qxp1Gh3AXPoJU_LGMCN9mnAw3whg&s" },
];

const categories = ["All", "Electronics", "Fashion", "Home & Kitchen", "Accessories", "Stationery"];

const Home = () => {
  const [search, setSearch] = useState("");
  const [selectedCategory, setSelectedCategory] = useState("All");

  const filteredProducts = products.filter((product) => {
    const matchesCategory =
      selectedCategory === "All" || product.category.toLowerCase() === selectedCategory.toLowerCase();
    const matchesSearch = product.name.toLowerCase().includes(search.toLowerCase());

    return matchesCategory && matchesSearch;
  });

  return (
    <div className="p-6">
      {/* Title */}
      <h1 className="text-3xl font-bold text-center mb-6">🛒 E-Commerce Store</h1>

      {/* Search & Category Filter */}
      <div className="flex flex-col md:flex-row justify-between items-center mb-6">
        <input
          type="text"
          placeholder="Search for products..."
          className="border rounded-md p-2 w-full md:w-1/3 mb-2 md:mb-0"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
        />

        <select
          className="border rounded-md p-2"
          value={selectedCategory}
          onChange={(e) => setSelectedCategory(e.target.value)}
        >
          {categories.map((cat) => (
            <option key={cat} value={cat}>
              {cat}
            </option>
          ))}
        </select>
      </div>

      {/* Product Grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        {filteredProducts.length > 0 ? (
          filteredProducts.map((product) => <ProductCard key={product.id} product={product} />)
        ) : (
          <p className="text-gray-500 col-span-full text-center">No products found</p>
        )}
      </div>
    </div>
  );
};

export default Home;