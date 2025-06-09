# @param n: An integer
# @param edges: a list of undirected edges
# @return: true if it's a valid tree, or false
def valid_tree(n, edges)
  # O(e+v), O(e+v)
  return true if n.zero?

  # create an adjacency list
  adj_list = Hash.new { |h,k| h[k] = [] }
  edges.each do |x, y|
    # add both since its undirected
    adj_list[x].append(y)
    adj_list[y].append(x)
  end

  # visited is all the edges in the dfs path
  visited = Set.new

  dfs = lambda do |i, prev|
    return false if visited.include?(i) # loop exists

    visited.add(i)

    # iterate through every neighbor of i
    adj_list[i].each do |j|
      next if j == prev # skip the false positive, since undirected graph
      return false unless dfs.call(j, i)
    end
    return true
  end

  # dfs returns true and it is a connected graph (all nodes are connected, not disjoint)
  dfs.call(0, -1) && n == visited.length
end
