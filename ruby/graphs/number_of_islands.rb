# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  # O(m * n * 4mn), O(4*m*n)
  return 0 if grid.flatten.empty?

  rows, cols = grid.length, grid[0].length
  visited = Set.new
  count = 0

  bfs = lambda do |r,c|
    queue = []
    queue << [r,c]
    visited << [r,c]

    while !queue.empty?
      r, c = queue.shift

      # check the 4 adjacent sides of current [r,c] pair
      directions = [[-1,0], [1,0], [0,1], [0,-1]]
      directions.each do |row, col|
        dr, dc = r + row, c + col

        # valid case
        if (0 <= dr && dr < rows && 0 <= dc && dc < cols &&
            grid[dr][dc] == '1' && !visited.include?([dr,dc]))
          queue << [dr,dc]
          visited << [dr,dc]
        end
      end
    end
  end

  for r in (0...rows)
    for c in (0...cols)
      if grid[r][c] == '1' && !visited.include?([r,c])
        bfs.call(r,c) # build the visited list (identify island boundary)
        count += 1
      end
    end
  end

  count
end
