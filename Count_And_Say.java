// Time taken is 198ms. Passed 18 test cases on leetcode.
public class Count_And_Say {
    public String countAndSay(int n) {
        
        // If n is 0 or less, these is no sequence so return empty string.
        if (n<=0)
            return "";
        
        int count = 0;
        StringBuilder str = new StringBuilder();
        
        // Append 1 to the string as the sequence start with 1.
        str.append("1");
        
        // In a loop, generate the next string in the sequence 'n'-1 times. 
        // Since "1" is already the first element in the sequence.
        for(int i=1; i<n; i++){
            
            // Creating the next sequence, looking at the previous one
            int j=0, len=str.length();
            StringBuilder result = new StringBuilder();
            
            // Loop through each element in the current i'th sequence string, and generate the next one.
            // If the j'th and the (j+1)'th element are the same, increase the count. Else, append the 
            // string with the count and the j'th element and continue with the next element in the string.
            while(j<len){
                count = 1;
                while(j<len-1 && str.charAt(j) == str.charAt(j+1)){
                    count++;
                    j++;
                }
                result.append(count);
                result.append(str.charAt(j));
                j++;
            }

            // Update the string 'str' to be the result string, as that will be used to create the 
            // next string in the sequence.
            str = result;
        }
        
        return str.toString();
    }
}