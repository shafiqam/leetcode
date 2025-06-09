=begin
https://leetcode.com/problems/trapping-rain-water/description/
Given n non-negative integers representing an elevation map where the width of each bar
is 1, compute how much water it can trap after raining.
Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The above elevation map (black section) is represented by array
[0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
Input: height = [4,2,0,3,2,5]
Output: 9
=end

# @param {Integer[]} height
# @return {Integer}
def trap(height)
  # O(n), O(1)
  l, r = 0, height.length - 1
  max_l, max_r = height[l], height[r]
  count = 0

  while l < r
    # move pointer, calculate water with current min(of max_l, max_r),
    # update corresponding max, update count only if positive
    if max_l <= max_r
      l += 1
      water = max_l - height[l]
      max_l = [max_l, height[l]].max
    else
      r -= 1
      water = max_r - height[r]
      max_r = [max_r, height[r]].max
    end
    count += water unless water < 0
  end
  count
end
