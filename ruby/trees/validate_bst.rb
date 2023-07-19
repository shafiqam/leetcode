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
# @return {Boolean}
def is_valid_bst(root)
  # O(n), O(n)
  min = -Float::INFINITY
  max = Float::INFINITY

  is_valid_node(root, min, max)
end

def is_valid_node(root, min, max)
  return true if root.nil?
  return false if !(min < root.val && root.val < max)

  is_valid_node(root.left, min, root.val) &&
  is_valid_node(root.right, root.val, max)
end
