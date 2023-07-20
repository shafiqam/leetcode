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
def inorder_traversal(root)
  # O(n), O(n)
  # recursive solution
  order = []
  inorder(root, order)
  order

  # O(n), O(n)
  # iterative solution
  order = []
  stack = []
  curr = root
  while true
    if curr
      stack << curr
      curr = curr.left
    else
      break if stack.empty?

      curr = stack.pop
      order << curr.val
      curr = curr.right
    end
  end
  order
end

def inorder(root, order)
  return if root.nil?

  inorder(root.left, order)
  order << root.val
  inorder(root.right, order)
end
