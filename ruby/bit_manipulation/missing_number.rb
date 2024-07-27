=begin
https://leetcode.com/problems/missing-number/description/
Given an array nums containing n distinct numbers in the range [0, n], return the only number
in the range that is missing from the array.
Input: nums = [3,0,1]
Output: 2
Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3].
2 is the missing number in the range since it does not appear in nums.
Input: nums = [0,1]
Output: 2
Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2].
2 is the missing number in the range since it does not appear in nums.
=end

# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  # O(n), O(1)
  full, missing = 0, 0
  # XOR operations: x^x = 0, x^0 = x, x^y = y^x
  # full^missing should give me the remaining number, the rest have zeroed each other out
  (0..nums.length).each do |n|
    full ^= n
  end
  nums.each do |n|
    missing ^= n
  end
  full ^ missing

  # O(n), O(1)
  # sum = nums.length * (nums.length + 1) * 0.5 # Gauss formula (n*(n+1))/2
  # nums.each do |n|
  #   sum -= n
  # end
  # sum.to_i
end
