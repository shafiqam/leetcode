# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  # O(n), O(1)
  l, r = 0, height.length-1
  largest_area = 0
  while l < r
    area = [height[l], height[r]].min * (l-r).abs
    largest_area = area if area > largest_area

    # increase those pointers that has the min height
    # if same height, increase either one is fine
    if height[l] <= height[r]
      l += 1
    else
      r -= 1
    end
  end
  largest_area
end
