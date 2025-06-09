# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  # O(n^2), O(1)
  l, r = 0, matrix[0].length - 1

  while l < r
    # loop while 0 to 3 in a 4x4 matrix
    for i in 0..(r-l-1)
      top, bottom = l, r

      top_left = matrix[top][l+i]

      # move bottom left to top left (w/ offset)
      matrix[top][l+i] = matrix[bottom-i][l]

      # move bottom right to bottom left (w/ offset)
      matrix[bottom-i][l] = matrix[bottom][r-i]

      # move top right to bottom right (w/ offset)
      matrix[bottom][r-i] = matrix[top+i][r]

      # move top left to top right (w/ offset)
      matrix[top+i][r] = top_left
    end

    l += 1
    r -= 1
  end
end
