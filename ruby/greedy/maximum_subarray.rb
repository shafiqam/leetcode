=begin
Given an integer array nums, find the subarray with the largest sum, and return its sum.
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: The subarray [4,-1,2,1] has the largest sum 6.
Input: nums = [1]
Output: 1
Explanation: The subarray [1] has the largest sum 1.
Input: nums = [5,4,-1,7,8]
Output: 23
Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.
=end

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  # O(n), O(1)
  curr_sum = 0
  max_sum = nums[0] # -Float::Infinity case

  nums.each do |n|
    # sum upto the previous point is negative, ignore it
    # since we are keeping max_sum every iteration
    curr_sum = 0 if curr_sum < 0
    curr_sum += n
    max_sum = [max_sum, curr_sum].max
  end
  max_sum
end
