
import { useCart } from "../context/CartContext";


const ProductCard = ({ product }) => {
  const { dispatch } = useCart();

  return (
    <div className="bg-white shadow-lg rounded-lg p-4 w-64 h-80 flex flex-col items-center transform transition-transform hover:scale-105">
      <div className="h-48 w-full flex justify-center items-center">
        <img src={product.image} alt={product.name} className="h-full w-full object-contain rounded-md" />
      </div>
      <h2 className="text-lg font-semibold mt-2 text-center">{product.name}</h2>
      <p className="text-green-600 font-bold">₹{product.price}</p>
      <button
        onClick={() => dispatch({ type: "ADD_TO_CART", payload: product })}
        className="mt-2 bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-700"
      >
        Add to Cart
      </button>
    </div>
  );
};

export default ProductCard;
