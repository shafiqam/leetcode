# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  # O(n^2), O(n)
  len = nums.length
  dp = Array.new(len) { 1 }

  # find an increasing subsequence in each starting from end
  # this way we can leverage dynamic programming
  (len-1).downto(0) do |i|
    # find the increasing subsequence starting at i
    (i+1..len-1).each do |j|
      dp[i] = [dp[i], 1 + dp[j]].max if nums[i] < nums[j]
    end
  end
  # find the max of all the dp values to find the longest
  dp.max
end
