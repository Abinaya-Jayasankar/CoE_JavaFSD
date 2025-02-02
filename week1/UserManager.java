import java.io.*;
import java.util.*;

class User implements Serializable {
    private String name;
    private String email;

    public User(String name, String email) {
        this.name = name;
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "Name: " + name + ", Email: " + email;
    }
}

public class UserManager {
    private List<User> users;

    public UserManager() {
        users = new ArrayList<>();
    }

    public void addUser(String name, String email) {
        User newUser = new User(name, email);
        users.add(newUser);
    }

    public void saveUsersToFile(String filename) {
        try {
            if (!filename.endsWith(".dat") && !filename.endsWith(".txt")) {
                filename += ".dat";
            }
            
            try (ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(filename))) {
                out.writeObject(users);
                System.out.println("Users saved successfully to: " + filename);
            }
        } catch (IOException e) {
            System.err.println("Error saving users: " + e.getMessage());
        }
    }

    public void loadUsersFromFile(String filename) {
        try {
            if (!filename.endsWith(".dat") && !filename.endsWith(".txt")) {
                filename += ".dat";
            }

            try (ObjectInputStream in = new ObjectInputStream(new FileInputStream(filename))) {
                users = (List<User>) in.readObject();
                System.out.println("Users loaded successfully from: " + filename);
            }
        } catch (IOException | ClassNotFoundException e) {
            System.err.println("Error loading users: " + e.getMessage());
        }
    }

    public void displayUsers() {
        if (users.isEmpty()) {
            System.out.println("No users to display.");
        } else {
            System.out.println("List of Users:");
            for (User user : users) {
                System.out.println(user);
            }
        }
    }

    public static void main(String[] args) {
        UserManager userManager = new UserManager();
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("1. Add User");
            System.out.println("2. Save Users to File");
            System.out.println("3. Load Users from File");
            System.out.println("4. Display Users");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 1:
                    System.out.print("Enter name: ");
                    String name = scanner.nextLine();
                    System.out.print("Enter email: ");
                    String email = scanner.nextLine();
                    userManager.addUser(name, email);
                    break;
                case 2:
                    System.out.print("Enter filename to save (e.g., users.dat or users.txt): ");
                    String filenameToSave = scanner.nextLine();
                    userManager.saveUsersToFile(filenameToSave);
                    break;
                case 3:
                    System.out.print("Enter filename to load (e.g., users.dat or users.txt): ");
                    String filenameToLoad = scanner.nextLine();
                    userManager.loadUsersFromFile(filenameToLoad);
                    break;
                case 4:
                    userManager.displayUsers();
                    break;
                case 5:
                    System.out.println("Exiting...");
                    scanner.close();
                    return;
                default:
                    System.out.println("Invalid choice, please try again.");
            }
        }
    }
}
