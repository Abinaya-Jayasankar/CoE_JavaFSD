package WarehouseManagementSystem;
import java.io.*;
import java.util.*;
import java.util.concurrent.*;

class InventoryManager {
    private Map<String, Product> products = new ConcurrentHashMap<>();
    private PriorityQueue<Order> orderQueue = new PriorityQueue<>();
    private ExecutorService executorService = Executors.newFixedThreadPool(3);
    private final String FILE_NAME = "inventory_data.ser";

    public InventoryManager() { loadInventory(); }

    public synchronized void addProduct(Product product) {
        products.put(product.getProductID(), product);
        System.out.println("Product added: " + product);
        saveInventory();
    }

    public void searchProduct(String name) {
        boolean found = false;
        for (Product product : products.values()) {
            if (product.getName().equalsIgnoreCase(name)) {
                System.out.println(product);
                found = true;
            }
        }
        if (!found) {
            System.out.println("Product '" + name + "' not found in inventory.");
        }
    }

    public void placeOrder(Order order) {
        orderQueue.add(order);
        System.out.println("Order placed: " + order.getOrderID() + " with priority " + order.getPriority());
    }

    public void processOrders() {
        while (!orderQueue.isEmpty()) {
            Order order = orderQueue.poll();
            if (order != null) {
                executorService.execute(() -> fulfillOrder(order));
            }
        }
        executorService.shutdown();
    }

    // Updated fulfillOrder method
    private void fulfillOrder(Order order) {
        System.out.println("Processing order: " + order.getOrderID());
        boolean allShipped = true; // To track if all products were shipped successfully

        for (String productID : order.getProductIDs()) {
            Product product = products.get(productID);
            if (product != null) {
                try {
                    product.reduceStock(1); // Reduce the stock by 1
                    System.out.println("Shipped: " + product.getName()); // Shipped message for each product
                } catch (OutOfStockException e) {
                    allShipped = false; // If any product is out of stock, mark the order as not fully shipped
                    System.out.println("Order failed: " + e.getMessage()); // Print error message for out of stock
                }
            } else {
                allShipped = false; // If product is not found, mark order as failed
                System.out.println("Product not found: " + productID);
            }
        }

        // After processing all products in the order, print whether the whole order is shipped
        if (allShipped) {
            System.out.println("Order " + order.getOrderID() + " has been fully shipped.");
        } else {
            System.out.println("Order " + order.getOrderID() + " could not be fully shipped.");
        }

        saveInventory(); // Save inventory after processing the order
    }

    private void saveInventory() {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(FILE_NAME))) {
            oos.writeObject(products);
        } catch (IOException e) {
            System.out.println("Error saving inventory.");
        }
    }

    @SuppressWarnings("unchecked")
    private void loadInventory() {
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(FILE_NAME))) {
            products = (ConcurrentHashMap<String, Product>) ois.readObject();
        } catch (IOException | ClassNotFoundException e) {
            System.out.println("No previous inventory found. Starting fresh.");
        }
    }
}
