package feesoftware;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        while (true) {
            System.out.println("1. Admin Login\n2. Accountant Login\n3. Exit");
            int choice = sc.nextInt();
            sc.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    System.out.print("Enter Admin Username: ");
                    String adminUser = sc.nextLine();
                    System.out.print("Enter Admin Password: ");
                    String adminPass = sc.nextLine();
                    if (AdminDAO.validateAdmin(adminUser, adminPass)) {
                        System.out.println("Admin Login Successful!");
                        while (true) {
                            System.out.println("1. Add Accountant\n2. View Accountants\n3. Edit Accountant\n4. Delete Accountant\n5. Logout");
                            int adminChoice = sc.nextInt();
                            sc.nextLine();

                            if (adminChoice == 1) {
                                System.out.print("Enter Accountant Name: ");
                                String name = sc.nextLine();
                                System.out.print("Enter Email: ");
                                String email = sc.nextLine();
                                System.out.print("Enter Phone: ");
                                String phone = sc.nextLine();
                                System.out.print("Enter Password: ");
                                String pass = sc.nextLine();
                                AdminDAO.addAccountant(name, email, phone, pass);
                            } else if (adminChoice == 2) {
                                AdminDAO.viewAccountants();
                            } else if (adminChoice == 3) {
                                System.out.print("Enter Accountant ID to Edit: ");
                                int id = sc.nextInt();
                                sc.nextLine();
                                System.out.print("Enter New Name: ");
                                String name = sc.nextLine();
                                System.out.print("Enter New Email: ");
                                String email = sc.nextLine();
                                System.out.print("Enter New Phone: ");
                                String phone = sc.nextLine();
                                System.out.print("Enter New Password: ");
                                String pass = sc.nextLine();
                                AdminDAO.editAccountant(id, name, email, phone, pass);
                            } else if (adminChoice == 4) {
                                System.out.print("Enter Accountant ID to Delete: ");
                                int id = sc.nextInt();
                                sc.nextLine();
                                AdminDAO.deleteAccountant(id);
                            } else if (adminChoice == 5) {
                                AdminDAO.logout();
                                break;
                            }
                        }
                    } else {
                        System.out.println("Invalid Credentials!");
                    }
                    break;

                case 2:
                    System.out.print("Enter Accountant Email: ");
                    String accEmail = sc.nextLine();
                    System.out.print("Enter Password: ");
                    String accPass = sc.nextLine();
                    if (AccountantDAO.validateAccountant(accEmail, accPass)) {
                        System.out.println("Accountant Login Successful!");
                        while (true) {
                            System.out.println("1. Add Student\n2. View Students\n3. Edit Student\n4. Delete Student\n5. View Due Fees\n6. Logout");
                            int accChoice = sc.nextInt();
                            sc.nextLine();

                            if (accChoice == 1) {
                                System.out.print("Enter Student Name: ");
                                String name = sc.nextLine();
                                System.out.print("Enter Email: ");
                                String email = sc.nextLine();
                                System.out.print("Enter Course: ");
                                String course = sc.nextLine();
                                System.out.print("Enter Fee: ");
                                double fee = sc.nextDouble();
                                System.out.print("Enter Paid Amount: ");
                                double paid = sc.nextDouble();
                                sc.nextLine();
                                System.out.print("Enter Address: ");
                                String address = sc.nextLine();
                                System.out.print("Enter Phone: ");
                                String phone = sc.nextLine();
                                AccountantDAO.addStudent(name, email, course, fee, paid, address, phone);
                            } else if (accChoice == 2) {
                                AccountantDAO.viewStudents();
                            } else if (accChoice == 3) {
                                System.out.print("Enter Student ID to Edit: ");
                                int id = sc.nextInt();
                                sc.nextLine();
                                System.out.print("Enter New Name: ");
                                String name = sc.nextLine();
                                System.out.print("Enter New Email: ");
                                String email = sc.nextLine();
                                System.out.print("Enter New Course: ");
                                String course = sc.nextLine();
                                System.out.print("Enter New Fee: ");
                                double fee = sc.nextDouble();
                                System.out.print("Enter New Paid Amount: ");
                                double paid = sc.nextDouble();
                                sc.nextLine();
                                System.out.print("Enter New Address: ");
                                String address = sc.nextLine();
                                System.out.print("Enter New Phone: ");
                                String phone = sc.nextLine();
                                AccountantDAO.editStudent(id, name, email, course, fee, paid, address, phone);
                            } else if (accChoice == 4) {
                                System.out.print("Enter Student ID to Delete: ");
                                int id = sc.nextInt();
                                sc.nextLine();
                                AccountantDAO.deleteStudent(id);
                            } else if (accChoice == 5) {
                                AccountantDAO.viewDueFees();
                            } else if (accChoice == 6) {
                                System.out.println("Logging out...");
                                break;
                            }
                        }
                    }
                    break;

                case 3:
                    System.out.println("Exiting...");
                    return;
            }
        }
    }
}
