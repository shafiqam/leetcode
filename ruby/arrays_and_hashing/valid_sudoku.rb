=begin
Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated
according to the following rules:
1. Each row must contain the digits 1-9 without repetition.
2. Each column must contain the digits 1-9 without repetition.
3. Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
Note:
1. A Sudoku board (partially filled) could be valid but is not necessarily solvable.
2. Only the filled cells need to be validated according to the mentioned rules.
Input: board =
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: true
Input: board =
[["8","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: false
Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
=end

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
