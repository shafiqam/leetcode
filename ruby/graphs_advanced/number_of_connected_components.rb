# @param n: the number of vertices
# @param edges: the edges of undirected graph
# @return: the number of connected components
def count_components(n, edges)
  # O(logn), O(n)
  parent = (0..n-1).to_a
  rank = Array.new(n) { 1 }

  # find the node n1's root parent
  find = lambda do |n1|
    res = n1
    # while node is not its own parent
    while res != par[res]
      par[res] = par[par[res]] # path compression
      res = par[res]
    end
    res
  end

  # union the two nodes
  union = lambda do |n1, n2|
    p1, p2 = find.call(n1), find.call(n2)
    return 0 if p1 == p2

    if rank[p1] > rank[p2]
      par[p2] = p1
      rank[p1] += rank[p2]
    else
      par[p1] = p2
      rank[p2] += rank[p1]
    end
    return 1
  end

  count = n
  edges.each do |n1, n2|
    count -= union.call(n1, n2)
  end
  count
end
