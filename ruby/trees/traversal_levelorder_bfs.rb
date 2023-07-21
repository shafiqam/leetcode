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
  return [] if root.nil?

  # O(n), O(h)
  # recursive solution
  order = []
  levelorder(root, order, 0)
  order

  # O(n), O(h)
  # iterative solution
  order = []
  queue = [root]
  while !queue.empty?
    len = queue.length
    level = []

    # get length of queue at start to determine how many nodes in current level
    # shift queue until all level nodes are retrieved and add their children onto the queue
    while len > 0
      curr = queue.shift
      level << curr.val
      queue << curr.left if curr.left
      queue << curr.right if curr.right
      len -= 1
    end
    order << level
  end
  order
end

def levelorder(root, order, level)
  return if root.nil?

  order[level] ||= []
  order[level] << root.val
  levelorder(root.left, order, level+1)
  levelorder(root.right, order, level+1)
end
