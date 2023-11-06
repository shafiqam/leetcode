# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
  # O(n), O(n)
  dp = Array.new(n+1) { 0 }
  offset = 1

  (1..n).each do |i|
    offset = i if offset * 2 == i
    dp[i] = 1 + dp[i - offset]
  end
  dp
end
