=begin
You are given an integer array nums. You are initially positioned at the array's first index,
and each element in the array represents your maximum jump length at that position. Return true
if you can reach the last index, or false otherwise.
Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0,
which makes it impossible to reach the last index.
=end

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  # O(n), O(1)
  goal = nums.length - 1

  # start at second last position
  i = goal - 1
  while i >= 0
    # update goal to the position we are jumping from
    goal = i if i + nums[i] >= goal
    i -= 1
  end

  goal == 0 ? true : false
end
