import { Link } from "react-router-dom";
import { useCart } from "../context/CartContext";

const Navbar = () => {
  const { cart } = useCart();

  return (
    <nav className="bg-gradient-to-r from-blue-600 to-indigo-700 p-4 shadow-lg flex justify-between items-center">  
      {/* Gradient Blue Navbar with Icons */}

      <div className="flex items-center space-x-3">
        <span className="text-yellow-300 text-3xl"></span>  {/* Shopping Cart Icon */}
        <h1 className="text-white text-3xl font-extrabold tracking-wide">
        💎 LuxeMart
        </h1>
      </div>

      <div className="space-x-6 flex items-center text-white text-lg">
        <Link to="/" className="flex items-center hover:text-yellow-300 transition">
          🏠 <span className="ml-1">Home</span>
        </Link>
        <Link to="/cart" className="flex items-center hover:text-yellow-300 transition">
          🛍 <span className="ml-1">Cart ({cart.length})</span>
        </Link>
        <Link to="/filter" className="flex items-center hover:text-yellow-300 transition">
          🔍 <span className="ml-1">Filter Products</span>
        </Link>
      </div>
    </nav>
  );
};

export default Navbar;