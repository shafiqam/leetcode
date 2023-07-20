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
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  # O(n), O(n)
  return -1 if root.nil?

  # iterative traversal
  count = 0
  stack = []
  curr = root
  while true
    if curr
      stack << curr
      curr = curr.left
    else
      return -1 if stack.empty? # if k > size of tree

      curr = stack.pop
      count += 1
      return curr.val if count == k

      curr = curr.right
    end
  end
end
