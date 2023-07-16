# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  # O(h), O(1)
  curr = root
  while curr # guaranteed to find p, q, so looping till curr is nil
    if p.val < curr.val && q.val < curr.val
      curr = curr.left
    elsif p.val > curr.val && q.val > curr.val
      curr = curr.right
    else
      return curr
    end
  end
end
