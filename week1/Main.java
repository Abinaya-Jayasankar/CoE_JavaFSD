import java.util.Scanner;

class BankAccount {
    private double balance;

    public synchronized void deposit(double amount) {
        balance += amount;
    }

    public synchronized boolean withdraw(double amount) {
        if (amount <= balance) {
            balance -= amount;
            return true;
        }
        return false;
    }

    public synchronized double getBalance() {
        return balance;
    }
}

class BankUser extends Thread {
    private BankAccount account;
    private String action;
    private double amount;

    public BankUser(BankAccount account, String action, double amount) {
        this.account = account;
        this.action = action;
        this.amount = amount;
    }

    @Override
    public void run() {
        if (action.equals("deposit")) {
            account.deposit(amount);
            System.out.println(Thread.currentThread().getName() + " deposited: " + amount);
        } else if (action.equals("withdraw")) {
            if (account.withdraw(amount)) {
                System.out.println(Thread.currentThread().getName() + " withdrew: " + amount);
            } else {
                System.out.println(Thread.currentThread().getName() + " failed to withdraw: " + amount);
            }
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        BankAccount account = new BankAccount();

        System.out.println("Enter initial account balance:");
        while (!scanner.hasNextDouble()) {
            System.out.println("Invalid input. Please enter a valid number for the balance.");
            scanner.next();
        }
        double initialBalance = scanner.nextDouble();
        account.deposit(initialBalance);

        System.out.println("Enter number of users:");
        int numUsers = scanner.nextInt();
        scanner.nextLine();

        for (int i = 0; i < numUsers; i++) {
            System.out.println("Enter action (deposit/withdraw):");
            String action = scanner.nextLine();

            System.out.println("Enter amount:");
            while (!scanner.hasNextDouble()) {
                System.out.println("Invalid input. Please enter a valid amount.");
                scanner.next();
            }
            double amount = scanner.nextDouble();
            scanner.nextLine();

            BankUser user = new BankUser(account, action, amount);
            user.start();
        }

        scanner.close();
    }
}
