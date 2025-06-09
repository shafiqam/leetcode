=begin
https://leetcode.com/problems/contains-duplicate/description/
Given an integer array nums, return true if any value appears at least twice in
the array, and return false if every element is distinct.
Input: nums = [1,2,3,1]
Output: true
Input: nums = [1,2,3,4]
Output: false
Input: nums = [1,1,1,3,3,4,3,2,4,2]
Output: true
=end

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  # O(n), O(n)
  hash = {}
  nums.each do |n|
    return true if hash.key? n
    hash[n] = true
  end && false
end
