// Time taken is 165ms. Passed 18 test cases on leetcode.
public class Number_To_Excel_Column_Title {
    public String convertToTitle(int n) {
        // Using StringBuilder to reduce the overhead of building new String objects everytime we update the string.
        StringBuilder column = new StringBuilder();
        
        // Loop while n is a positive integer
        while(n > 0){
            
            // Decrement the number since we are adding the remainder to the ASCII value of char 'A'.
            // Say we are converting 2 to print B, we need to add 1 more to the ASCII of A ('A' + 1 => 'B')
            n--;

            // Add remainder of (n % 26) to ASCII of 'A' and insert this character to the 0th position of the string.
            // Update the number diving it by 26 (number of alphabets) everytime in the loop.
            column.insert(0, (char) ('A' + (n % 26)));
            n = n/26;
        }
        
        return column.toString();
    }
}