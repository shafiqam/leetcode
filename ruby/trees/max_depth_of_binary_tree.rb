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

  ldepth = root.left ? max_depth(root.left) : 0
  rdepth = root.right ? max_depth(root.right) : 0
  return (1 + [ldepth, rdepth].max)
end
