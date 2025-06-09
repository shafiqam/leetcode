# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  # O(m * n), O(n)
  # each row is of size n, and bottom most row will be all ones
  row = Array.new(n) { 1 }

  # calculate remaining rows (0, 1, ..m-2)
  (0..m-2).each do |r|
    temp_row = Array.new(n) { 1 }
    # excluding right most row as it will all be ones
    # also to avoid edge case of going out of bounds
    (n-2).downto(0) do |c|
      temp_row[c] = temp_row[c+1] + row[c]
    end
    # update row to new row
    row = temp_row
  end
  row[0]
end
