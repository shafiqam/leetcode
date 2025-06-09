# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def max_path_sum(root)
  # O(n), O(n)
  # if single element, then return root value
  return root.val if root.left.nil? && root.right.nil?

  _, max_sum = dfs_helper(root)
  max_sum
end

def dfs_helper(root)
  # default: path_sum, max_sum is -infinity
  # since tree contains negative values
  return -Float::INFINITY, -Float::INFINITY if root.nil?

  # recursive dfs returns the curr max sum (includes splitting)
  # and path sum (non split), this gets added
  left_path_sum, left_max_sum = dfs_helper(root.left)
  right_path_sum, right_max_sum = dfs_helper(root.right)

  # to avoid edge cases
  # path sums should be >=0, since we want max, negative values will decrease the sum.
  # max sum is a max of left and right, because in case of a tree full of negative values,
  # we want the lowest negative value (max sum)
  left_path_sum = [left_path_sum, 0].max
  right_path_sum = [right_path_sum, 0].max
  max_sum = [left_max_sum, right_max_sum].max

  # use max_sum to keep track of current max, max of split and current max
  split_sum = left_path_sum + root.val + right_path_sum
  max_sum = [max_sum, split_sum].max

  # curr path sum would have to be chosen, max of either L+root, root+R, 0
  path_sum = [(left_path_sum + root.val), (right_path_sum + root.val), 0].max

  return path_sum, max_sum
end
