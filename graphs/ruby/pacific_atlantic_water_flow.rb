# @param {Integer[][]} heights
# @return {Integer[][]}
def pacific_atlantic(heights)
  # O(m * n * 4mn), O(4*m*n)
  rows, cols = heights.length, heights[0].length
  pac, atl = Set.new, Set.new

  dfs = lambda do |r, c, visited, prev_height|
    return if (visited.include?([r,c]) or
              r < 0 or c < 0 or r == rows or c == cols or
              heights[r][c] < prev_height)

    visited << [r,c]

    dfs.call(r+1, c, visited, heights[r][c])
    dfs.call(r-1, c, visited, heights[r][c])
    dfs.call(r, c+1, visited, heights[r][c])
    dfs.call(r, c-1, visited, heights[r][c])
  end

  # Top row (to pacific) and bottom row (to atlantic)
  for c in (0...cols)
    dfs.call(0, c, pac, heights[0][c])
    dfs.call(rows-1, c, atl, heights[rows-1][c])
  end

  # Left row (to pacific) and right row (to atlantic)
  for r in (0...rows)
    dfs.call(r, 0, pac, heights[r][0])
    dfs.call(r, cols-1, atl, heights[r][cols-1])
  end

  # we want cells if in both pac and atl
  both = []
  for r in (0...rows)
    for c in (0...cols)
      both << [r,c] if pac.include?([r,c]) and atl.include?([r,c])
    end
  end
  both
end
