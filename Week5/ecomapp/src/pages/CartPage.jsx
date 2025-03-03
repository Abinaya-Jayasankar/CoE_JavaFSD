
import { useCart } from "../context/CartContext";

const CartPage = () => {
  const { cart, dispatch } = useCart();
  const totalPrice = cart.reduce((acc, item) => acc + item.price, 0);

  return (
    <div 
      className="min-h-screen flex flex-col items-center justify-center p-6"
      style={{ backgroundImage: "url('/cart-bg.jpg')", backgroundSize: "cover", backgroundPosition: "center" }}>

      <div className="bg-white/80 backdrop-blur-md p-6 rounded-xl shadow-lg w-full max-w-3xl">
        {/* Glass Effect */}
        <h1 className="text-3xl font-extrabold text-center text-blue-700">🛍️ Shopping Cart</h1>
        
        {cart.length === 0 ? (
          <p className="text-gray-600 mt-4 text-center text-lg">Your cart is empty.</p>
        ) : (
          <div className="mt-4">
            {cart.map((item) => (
              <div key={item.id} className="flex justify-between items-center bg-white p-4 mb-2 shadow-md rounded-md">
                <p className="font-semibold">{item.name}</p>
                <p className="text-green-600 font-bold">₹{item.price}</p>
                <button
                  onClick={() => dispatch({ type: "REMOVE_FROM_CART", payload: item.id })}
                  className="bg-red-500 text-white px-4 py-2 rounded-md hover:bg-red-700 transition"
                >
                  ❌ Remove
                </button>
              </div>
            ))}
            <h2 className="text-xl font-bold mt-4 text-center">Total: <span className="text-green-700">₹{totalPrice}</span></h2>

            <button className="bg-gradient-to-r from-yellow-500 to-orange-500 text-black px-6 py-3 mt-4 w-full rounded-lg hover:shadow-lg transition">
              ✅ Proceed to Checkout
            </button>
          </div>
        )}
      </div>
    </div>
  );
};

export default CartPage;
