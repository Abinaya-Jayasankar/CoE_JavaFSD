import java.util.Scanner;

public class StringProcessor {

    public static String reverseString(String str) {
        String reversed = "";
        for (int i = str.length() - 1; i >= 0; i--) {
            reversed += str.charAt(i);
        }
        return reversed;
    }

    public static int countOccurrences(String text, String sub) {
        int count = 0;
        String[] words = text.split(" ");
        for (int i = 0; i < words.length; i++) {
            if (words[i].equals(sub)) {
                count++;
            }
        }
        return count;
    }

    public static String splitAndCapitalize(String str) {
        String[] words = str.split(" ");
        String result = "";
        for (int i = 0; i < words.length; i++) {
            if (!words[i].isEmpty()) 
        	{
                result += words[i].substring(0, 1).toUpperCase() + words[i].substring(1).toLowerCase() + " ";
            } 
        }
        return result.trim();
    }

    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        
        System.out.print("Enter a string to reverse: ");
        String original = s.nextLine();
        System.out.println("Reversed String: " + reverseString(original));

        System.out.print("Enter a text to count occurrences of a substring: ");
        String text = s.nextLine();
        System.out.print("Enter the substring to count: ");
        String sub = s.nextLine();
        System.out.println("Occurrences of '" + sub + "': " + countOccurrences(text, sub));

        System.out.print("Enter a sentence to capitalize each word: ");
        String sentence = s.nextLine();
        System.out.println("Capitalized String: " + splitAndCapitalize(sentence));
        
       
    }
}
