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
# @return {Integer[]}
def preorder_traversal(root)
  # O(n), O(n)
  # recursive solution
  order = []
  preorder(root, order)
  order

  # O(n), O(n)
  # iterative solution
  return [] if root.nil?

  order = []
  stack = [root]
  curr = root
  while !stack.empty?
    curr = stack.pop
    order << curr.val

    # add to stack the one that needs to be processed later
    stack << curr.right if curr.right
    stack << curr.left if curr.left
  end
  order
end

def preorder(root, order)
  return if root.nil?

  order << root.val
  preorder(root.left, order)
  preorder(root.right, order)
end
