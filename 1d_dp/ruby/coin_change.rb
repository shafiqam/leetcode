# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  # O(amount * coins.length), O(amount)
  dp = Array.new(amount + 1) { Float::INFINITY }

  dp[0] = 0
  for amt in (1..amount)
    for c in coins
      # if the difference is positive, dp value would be min of itself and diff
      diff = amt - c
      dp[amt] = [dp[amt], 1 + dp[diff]].min if diff >= 0
    end
  end

  dp[amount] != Float::INFINITY ? dp[amount] : -1
end
