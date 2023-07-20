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
def postorder_traversal(root)
  # O(n), O(n)
  # recursive solution
  order = []
  postorder(root, order)
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
    stack << curr.left if curr.left
    stack << curr.right if curr.right
  end
  order.reverse
end

def postorder(root, order)
  return if root.nil?

  postorder(root.left, order)
  postorder(root.right, order)
  order << root.val
end
