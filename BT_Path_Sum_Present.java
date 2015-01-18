// Time taken is 248ms. Passed 114 test cases on leetcode.
/**
 * Definition for binary tree
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class BT_Path_Sum_Present {
    public boolean hasPathSum(TreeNode root, int sum) {
        // If no BT exists, then any sum would not exist so return false.
        if (root == null)
            return false;
        else{
            // Decrement the path sum by the root's value.
            sum -= root.val;
            
            // If reached a root node and sum is 0, then pathsum exists (return true)
            // Else, navigate further down to reach the leaf node on that path.
            return ((root.left == null && root.right == null && sum == 0) ||
                    hasPathSum(root.left, sum) || hasPathSum(root.right, sum));
        }
    }
}