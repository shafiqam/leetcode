// Time taken is 199ms. Passed 502 test cases on leetcode.
public class Factorial_Trailing_Zeros {
    
    public int trailingZeroes(int n) {
        int count = 0;
        
        // In the loop, we calculate the multiples of 2 and 5 as they generate the trailing zeros.
        // Since we know that the multiples of 2 are more than the multiples of 5, we can ignore the 2 multiples.
        // The count would then be (n/5 + n/25 + n/125 + ...), the reason being, that when we multiply a number by 5,
        // the numbers like 25 (5*5) have two 5s in them and we have ignored one 5, to catch cases like these we 
        // divide the factorial number by every multiple of 5 till the division results in less than 1.
        
        // For all values less than 5, there are no trailing zeros as there are no multiples of 5.
        while(n > 4){
            
        	// Divide by 5 everytime and update the count by the number of multiples.
            n = n/5;
            count += n;
        }
        
        return count;
    }
}