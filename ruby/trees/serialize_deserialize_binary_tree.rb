# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
  # O(n), O(h)
  order = []
  preorder(root, order)

  # return a comma separated string with N in place of nils
  order.join(',')
end

def preorder(root, order)
  if root.nil?
    order << 'N'
    return order
  end

  order << root.val
  preorder(root.left, order)
  preorder(root.right, order)
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
  # O(n), O(h)
  arr = data.split(',')
  create_tree(arr)
end

def create_tree(arr)
  if arr[0] == 'N'
    arr.shift
    return nil
  end

  node = TreeNode.new(arr[0].to_i)
  arr.shift # remove array element after processed
  node.left = create_tree(arr)
  node.right = create_tree(arr)

  return node
end

# Your functions will be called as such:
# deserialize(serialize(data))
