=begin
https://leetcode.com/problems/container-with-most-water/description/
You are given an integer array height of length n. There are n vertical lines drawn such
that the two endpoints of the ith line are (i, 0) and (i, height[i]). Find two lines that
together with the x-axis form a container, such that the container contains the most water.
Return the maximum amount of water a container can store. Notice that you may not slant
the container.
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
Input: height = [1,1]
Output: 1
=end

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  # O(n), O(1)
  l, r = 0, height.length-1
  largest_area = 0
  while l < r
    area = [height[l], height[r]].min * (r - l)
    largest_area = [largest_area, area].max

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
