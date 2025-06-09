# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  # O(m*n), O(1)
  # intentionally keeping right and bottom to length
  # and not len-1 for easy calculation
  left, right = 0, matrix[0].length
  top, bottom = 0, matrix.length
  res = []

  while left < right && top < bottom
    # process the top row
    for i in (left...right) # exclusive
      res.append(matrix[top][i])
    end
    top += 1

    # process the right col
    for i in (top...bottom) # exclusive
      res.append(matrix[i][right-1])
    end
    right -= 1

    # add case to break in case of row-only or col-only matrix
    break unless left < right && top < bottom

    # process the bottom row
    (right-1).downto(left) do |i|
      res.append(matrix[bottom-1][i])
    end
    bottom -= 1

    # process the left col
    (bottom-1).downto(top) do |i|
      res.append(matrix[i][left])
    end
    left += 1
  end

  res
end
