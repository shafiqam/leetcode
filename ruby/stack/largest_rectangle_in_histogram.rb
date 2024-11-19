=begin
https://leetcode.com/problems/largest-rectangle-in-histogram/description/
Given an array of integers heights representing the histogram's bar height where the width
of each bar is 1, return the area of the largest rectangle in the histogram.
Input: heights = [2,1,5,6,2,3]
Output: 10
Explanation: The above is a histogram where width of each bar is 1.
The largest rectangle is shown in the red area, which has an area = 10 units.
Input: heights = [2,4]
Output: 4
=end

# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  # O(n), O(n)
  stack = []
  max_area = 0
  heights.each_with_index do |height, index|
      # until curr ht < top of stack ht, keep popping, calculate area
      # make sure to keep track of start index for width calculations
      start = index
      while !stack.empty? && height < stack[-1][0]
          h, i = stack.pop
          max_area = [max_area, h * (index - i)].max
          start = i # back track index for width (for possible calculable area)
      end
      # stack when increasing heights
      stack << [height, start]
  end

  # if stack is still non-empty, pop all those out to calcualte max possible areas
  while !stack.empty?
      h, i = stack.pop
      # using heights.length here since reached end of array
      max_area = [max_area, h * (heights.length - i)].max
  end
  max_area
end
