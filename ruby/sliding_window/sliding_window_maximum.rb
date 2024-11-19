=begin
https://leetcode.com/problems/sliding-window-maximum/description/
You are given an array of integers nums, there is a sliding window of size k which is moving
from the very left of the array to the very right. You can only see the k numbers in the window.
Each time the sliding window moves right by one position. Return the max sliding window.
Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]
Explanation:
Window position                Max
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7
Input: nums = [1], k = 1
Output: [1]
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  # O(n), O(n)
  # deque is always decreasing
  # this deque stores indexes of values that are in decreasing order
  deque = []
  result = []
  l, r = 0, 0

  while r < nums.length
      # pop all indexes of values lower than the current value (nums[r])
      deque.pop while !deque.empty? and nums[deque.last] < nums[r]

      # add the current right index to the deque
      deque << r

      # remove leftmost index from deque if window is over size k
      # pop from left if the leftmost index in deque is lower than current l
      if deque.first < l
          deque.shift
      end

      # when window is atleast size k (valid window)
      # (r + 1) signifies window len, (+ 1 to offset the 0-index)
      # if window len is atleast k, append to result array
      # ie, calculate max only when window is atleast size k
      if (r + 1) >= k
          result << nums[deque.first] # add deque's first (index of max) element and add to result
          l += 1
      end

      r += 1
  end
  result
end
