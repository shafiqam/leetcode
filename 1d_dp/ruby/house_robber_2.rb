# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  # O(n), O(1)
  return nums[0] if nums.length == 1

  helper = lambda do |nums|
    rob1, rob2 = 0, 0

    # [rob1, rob2, n, n+1, ...]
    nums.each do |n|
      temp = [rob1 + n, rob2].max
      rob1 = rob2
      rob2 = temp
    end
    rob2
  end

  excluding_first = helper.call(nums[1..-1])
  excluding_last = helper.call(nums[0..-2])

  # run the house robber one sol 2 times, and get the max of those
  [excluding_first, excluding_last].max
end
