public class Majority_Element {
    public int majorityElement(int[] num) {
        
        // ** Using the Moore's Voting Algorithm - 2 phases each of linear time complexity **
        int len = num.length;
        int criteria = (len/2) + 1;
        if (len==0){
            System.out.println("No majority element");
            return -1;
        }
            
        // If the array is non-empty, initialize the majority element with the first element and increase the count.
        int majority = num[0];
        int count = 1;
        
        // Phase 1
        // Finding the candidate for the majority element.
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
        for(int i=0; i<len; i++){
            if(majority == num[i] && --criteria == 0)
                break;
        }
        return majority;
    }
}