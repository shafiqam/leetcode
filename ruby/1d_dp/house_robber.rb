# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  # O(n), O(1)
  rob1, rob2 = 0, 0

  # [rob1, rob2, n, n+1, ...]
  nums.each do |n|
    temp = [rob1 + n, rob2].max
    rob1 = rob2
    rob2 = temp
  end
  rob2

  # logically, didnt bothher figuring it out (neetcode answer)
  # dp = Array.new(nums.size + 3) { 0 }
  # nums.each_with_index do |num, i|
  #   dp[i + 3] = num + [dp[i + 1], dp[i]].max
  # end
  # [dp[-1], dp[-2]].max
end
