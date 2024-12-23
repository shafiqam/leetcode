=begin
https://leetcode.com/problems/two-sum/description/
Given an array of integers nums and an integer target, return indices of the two
numbers such that they add up to target. You may assume that each input would have
exactly one solution, and you may not use the same element twice. You can return the
answer in any order.
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Input: nums = [3,2,4], target = 6
Output: [1,2]
Input: nums = [3,3], target = 6
Output: [0,1]
=end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  # O(n), O(n)
  hash = {} # val: index
  nums.each_with_index do |val, index|
    diff = target - val
    return [hash[diff], index] if hash.key? diff
    hash[val] = index
  end
end
