import java.util.Scanner;

public class ExceptionHandling {

    public static void processInput()
    {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter a number to calculate its reciprocal: ");
        
        try {
            double number = Double.parseDouble(scanner.nextLine());
            
            if (number == 0) {
                throw new ArithmeticException("Cannot calculate the reciprocal of zero.");
            }

            double reciprocal = 1.0 / number;
            System.out.println("The reciprocal of " + number + " is " + reciprocal);

        } catch (NumberFormatException e) {
            System.out.println("Error: Invalid input! Please enter a valid number.");

        } catch (ArithmeticException e) {
            System.out.println("Error: " + e.getMessage());

        } finally {
            scanner.close();
            System.out.println("Input processing complete.");
        }
    }

    public static void main(String[] args) {
        processInput();
    }
}
