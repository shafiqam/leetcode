=begin
https://leetcode.com/problems/3sum/description/
Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such
that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0. Notice that the
solution set must not contain duplicate triplets.
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Explanation:
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
Notice that the order of the output and the order of the triplets does not matter.
Input: nums = [0,1,1]
Output: []
Explanation: The only possible triplet does not sum up to 0.
Input: nums = [0,0,0]
Output: [[0,0,0]]
Explanation: The only possible triplet sums up to 0.
=end

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  # O(nlogn) + O(n.n) ~ O(n^2), O(1)
  # sort the arr
  nums.sort!

  # traverse arr, and find all tuples for a current number and move forward finding others
  result = []
  nums.each_with_index do |n, index|
    # skip if previous value is same as current
    # make sure do this after first element or it compares to last element (-1 index)
    next if index > 0 && n == nums[index - 1]
    target = -1 * n # all triplets must map to 0

    l, r = index + 1, nums.length - 1
    while l < r
      if nums[l] + nums[r] == target
        result << [n, nums[l], nums[r]]
        # move forward to search next tuple
        l += 1
        # skip if previous value is same as current
        l += 1 while l < r && nums[l] == nums[l-1]
      elsif nums[l] + nums[r] < target
        l += 1
      else
        r -= 1
      end
    end
  end
  result
end
