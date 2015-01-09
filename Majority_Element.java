// Time taken is 246ms. Passed 40 test cases on leetcode.
public class Solution {
    public int majorityElement(int[] num) {
        
        // **Using the Moore's Voting Algorithm - 2 phases each of linear time complexity**
        int len = num.length;
        int criteria = (len/2) + 1;
        // Assuming that the array only has positive integers, we return -1 in case there is no majority element.
        if (len==0){
            return -1;
        }
            
        // If the array is non-empty, initialize the majority element with the first element and increase the count.
        int majority = num[0];
        int count = 1;
        
        // Phase 1
        // Finding the candidate for the majority element.
        // Scan the array once, by comapring the majority element with the current array indexed element.
        // If they are same, increment the count, if they are different decrement the count.
        // If the count reaches 0, assign the current element as majority element and increment the count to be 1 again.
        for(int i=1; i<len; i++){
            if(majority == num[i])
                ++count;
            else if (--count == 0){
                majority = num[i];
                ++count;
            }
        }
        
        // Phase 2
        // Check if the candidate is the majority element or not.
        // We initialized the criteria to be (n/2)+1. 
        // Everytime we encounter the majority candidate, decrement the criteria which when reaches zero means 
        // we have confirmed it is the majority candidate. And set the flag to 1 and break out of the loop.
        int ismajority = 0;
        for(int i=0; i<len; i++){
            if(majority == num[i] && --criteria == 0){
                ismajority = 1;
                break;
            }
        }
        
        // Return majority element is flag is set else return -1,
        // signifying that the candidate was not the majority element.
        return (ismajority == 1) ? majority : -1;
    }
}