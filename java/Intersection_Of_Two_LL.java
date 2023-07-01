// Time taken is 165ms. Passed 65 test cases on leetcode.
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Intersection_Of_Two_LL {
    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        if(headA == null || headB == null)
            return null;
        
        int acount = getCount(headA);
        int bcount = getCount(headB);
        int diff = acount - bcount;
        
        return (diff >= 0) ? intersectNode(headA, headB, diff) : intersectNode(headB, headA, -diff);
    }
    
    ListNode intersectNode(ListNode large, ListNode small, int diff){
        
        // Scroll the difference through the longer list
        for(int i=0; i<diff; i++){
            large = large.next;
        }
        
        while(large != null && small != null){
            if(large == small){
                return large;
            }
                
            large = large.next;
            small = small.next;
        }
        
        return null;
    }
    
    int getCount(ListNode node){
        int count=0;
        while(node != null){
            node = node.next;
            count++;
        }
        return count;
    }
}