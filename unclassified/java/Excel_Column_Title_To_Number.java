// Time taken is 204ms. Passed 1000 test cases on leetcode.
public class Excel_Column_Title_To_Number {
    public int titleToNumber(String s) {
        // Convert string to a character array and initialize col_num to be 0.
        char[] str = s.toCharArray();
        int col_num = 0;
        
        // Loop through each character in the string
        for(char c : str){
            
            // Multiply the current value of col_num by 26, and add the value of (c - 'A' + 1) or (c - 64) to the
            // string. I use the former one since it is easy to understand. We subtract the ASCII value of A from the
            // current character ASCII value and add one to the sum. 
            // Say we convert B to print 2, we need to add 1 more to the result of (char - 'A') since 'A' corresponds
            // to 1 and (char-'A') is removing 1 from the result already.
            col_num *= 26;
            col_num += c - 'A' + 1;
            //col_num += ((int) c) - 64;
        }
        
        return col_num;
    }
}