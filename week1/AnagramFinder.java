import java.util.*;

public class AnagramFinder {
    public List<Integer> findAnagrams(String s, String p) {
        List<Integer> result = new ArrayList<>();
        
        if (s.length() < p.length()) {
            return result;
        }
        
        int[] pCount = new int[26];
        for (char c : p.toCharArray()) {
            pCount[c - 'a']++;
        }

        int[] sCount = new int[26];
        int pLength = p.length();

        for (int i = 0; i < pLength; i++) {
            sCount[s.charAt(i) - 'a']++;
        }

        if (Arrays.equals(pCount, sCount)) {
            result.add(0);
        }

        for (int i = pLength; i < s.length(); i++) {
            sCount[s.charAt(i) - 'a']++;
            sCount[s.charAt(i - pLength) - 'a']--;
            
            if (Arrays.equals(pCount, sCount)) {
                result.add(i - pLength + 1);
            }
        }

        return result;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Enter the string s: ");
        String s = scanner.nextLine();
        
        System.out.println("Enter the string p: ");
        String p = scanner.nextLine();
        
        AnagramFinder finder = new AnagramFinder();
        List<Integer> result = finder.findAnagrams(s, p);
        
        System.out.println("Anagram starting indices: " + result);
        
        scanner.close();
    }
}
