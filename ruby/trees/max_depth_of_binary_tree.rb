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
def max_depth(root)
  # O(n), O(h)
  return 0 if root.nil?

  ldepth = max_depth(root.left)
  rdepth = max_depth(root.right)
  return (1 + [ldepth, rdepth].max)
end
