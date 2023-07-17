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
# @return {Integer[][]}
def level_order(root)
  # O(n), O(n)
  # This is BFS
  return [] if root.nil?

  result = []
  queue = [root]
  while !queue.empty?
    len = queue.length
    level = []
    while len > 0 do
      curr = queue.shift

      # add popped value to result set in level
      level << curr.val

      # add children of that level onto queue
      queue << curr.left if curr.left
      queue << curr.right if curr.right

      len -= 1
    end
    result << level
  end
  result
end
