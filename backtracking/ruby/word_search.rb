# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  # O(m * n * 4^(word.length)), O(4^(word.length))
  rows, cols = board.length, board[0].length
  visited = Set.new

  return false if board.flatten.uniq.length < word.chars.uniq.length

  # search next word in char in dfs recursion
  dfs = lambda do |r, c, index|
    # found every char in the word
    return true if index == word.length

    # false if out of bounds OR (r,c) has been visited OR given char not in board location
    return false if (r < 0 || c < 0 || r >= rows || c >= cols ||
                    word[index] != board[r][c] || visited.include?([r,c]) )

    # add correct char in visited path
    visited.add([r,c])

    # recurse through 4 possibilites
    result = dfs.call(r - 1, c, index + 1) ||
            dfs.call(r + 1, c, index + 1) ||
            dfs.call(r, c - 1, index + 1) ||
            dfs.call(r, c + 1, index + 1)

    # remove to cleanup
    visited.delete([r,c])

    return result
  end

  # iterate through each (r,c) tuple until we find the word
  for r in (0...rows)
    for c in (0...cols)
      return true if dfs.call(r, c, 0)
    end
  end
  false # word not found
end
