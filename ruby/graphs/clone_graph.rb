# Definition for a Node.
# class Node
#     attr_accessor :val, :neighbors
#     def initialize(val = 0, neighbors = nil)
#		  @val = val
#		  neighbors = [] if neighbors.nil?
#         @neighbors = neighbors
#     end
# end

# @param {Node} node
# @return {Node}
def cloneGraph(node)
  # O(n), O(n), n: edges + vertices
  return nil if node.nil?

  old_to_new = {}
  clone = lambda do |node|
    return old_to_new[node] if old_to_new.key? node

    # create copy node and add to hash
    copy = Node.new(node.val)
    old_to_new[node] = copy

    # clone each of node's neighbors and add to new copy node's neighbor list
    node.neighbors.each do |n|
      copy.neighbors << clone.call(n)
    end

    copy
  end

  clone.call(node)
end
