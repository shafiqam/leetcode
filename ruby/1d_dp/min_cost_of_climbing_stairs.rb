# @param {Integer[]} cost
# @return {Integer}
def min_cost_climbing_stairs(cost)
  # O(n), O(n)
  return 0 if cost.empty?
  return cost[0] if cost.length == 1

  dp = []
  n = cost.length
  dp[n] = 0
  dp[n-1] = cost[n-1]
  (n-2).downto(0) do |i|
    # get the min of either the 1-step or 2-step and add that to the curr node cost
    dp[i] = cost[i] + [dp[i+1], dp[i+2]].min
  end

  # can start from 0th or 1st step
  [dp[0], dp[1]].min
end
