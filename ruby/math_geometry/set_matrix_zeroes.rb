# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  # O(m*n), O(1)
  rows, cols = matrix.length, matrix[0].length
  row_zero = false

  # determine which rows/cols need to be zero
  for r in (0..rows-1)
    for c in (0..cols-1)
      if matrix[r][c] == 0
        # update the 1st row
        matrix[0][c] = 0

        # update the 1st col
        if r > 0
          matrix[r][0] = 0
        else
          row_zero = true
        end
      end
    end
  end

  # update the matrix in place (minus 1st row/col)
  for r in (1..rows-1)
    for c in (1..cols-1)
      matrix[r][c] = 0 if matrix[0][c] == 0 || matrix[r][0] == 0
    end
  end

  # update the matrix in place (for the 1st col)
  if matrix[0][0] == 0
    for r in (0..rows-1)
      matrix[r][0] = 0
    end
  end

  # update the matrix in place (for the 1st row)
  if row_zero
    for c in (0..cols-1)
      matrix[0][c] = 0
    end
  end
end
