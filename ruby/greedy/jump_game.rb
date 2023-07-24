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
