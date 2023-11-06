# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  # O(mn), O(mn)
  # O(9*9), O(9*9), m -> rows, n -> cols
  hasValidRowsAndColumns(board) && hasValidBoxes(board)
end

def hasValidRowsAndColumns(board)
  (0...9).each do |x|
    row = []
    col = []
    (0...9).each do |y|
      row << board[x][y]
      col << board[y][x]
    end
    return false unless valid?(row) && valid?(col)
  end && true
end

def hasValidBoxes(board)
  x_cap = 0
  while x_cap < 9
    y_cap = 0
    while y_cap < 9
      box = []
      (x_cap...(x_cap+3)).each do |x|
        (y_cap...(y_cap+3)).each do |y|
          box << board[x][y]
        end
        return false unless valid?(box)
      end
      y_cap += 3
    end
    x_cap += 3
  end
  true
end

def valid?(arr)
  hash = {}
  arr.each do |n|
    next if n == '.'
    return false if hash.key? n
    hash[n] = true
  end && true
end
