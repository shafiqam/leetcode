# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  # O(n), O(n)
  # using dp array
  return 0 if n == 0
  return 1 if n == 1

  dp = []
  dp[n] = 1
  dp[n-1] = 1
  (n-2).downto(0) do |i|
    dp[i] = dp[i+1] + dp[i+2]
  end
  dp[0]

  # O(n), O(1)
  # one_step = 1
  # two_step = 1

  # for i in 1..n-1
  #   temp = one_step
  #   one_step = one_step + two_step
  #   two_step = temp
  # end
  # one_step
end
