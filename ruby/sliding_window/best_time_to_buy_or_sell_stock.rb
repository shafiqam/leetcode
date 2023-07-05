# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  # O(n), O(1)
  max_p = 0
  l, r = 0, 1
  while r < prices.length
    if prices[l] < prices[r]
      profit = prices[r] - prices[l]
      max_p = profit if profit > max_p
    else
      l = r # found a new low price
    end
    r += 1
  end
  max_p
end
