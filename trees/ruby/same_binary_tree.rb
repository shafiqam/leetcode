# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  # O(p+q), O([logp,logq].min) ~ O(h(p or q))
  if p.nil? && q.nil?
    true
  elsif p && q
    p.val == q.val &&
    is_same_tree(p.left, q.left) &&
    is_same_tree(p.right, q.right)
  else
    # one exists and other does not
    false
  end
end
