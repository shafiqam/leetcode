# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  # O(n), O(1)
  curr_sum = 0
  max_sum = nums[0]

  nums.each do |n|
    # sum upto the previous point is negative, ignore it
    # since we are keeping max_sum every iteration
    curr_sum = 0 if curr_sum < 0
    curr_sum += n
    max_sum = [max_sum, curr_sum].max
  end
  max_sum
end
