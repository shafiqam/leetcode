# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  # O(n), O(n)
  return nil if preorder.empty? || inorder.empty?

  # get the first element from preorder
  # find the index of that in the inorder, to separate left and right subtrees
  root = TreeNode.new(preorder[0])
  mid = inorder.index(preorder[0])

  # call recursion on left and right subtrees
  root.left = build_tree(preorder[1..mid], inorder[0..mid-1])
  root.right = build_tree(preorder[mid+1..-1], inorder[mid+1..-1])

  return root
end
