=begin
https://leetcode.com/problems/counting-bits/description/
Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n),
ans[i] is the number of 1's in the binary representation of i.
Input: n = 2
Output: [0,1,1]
Explanation:
0 --> 0
1 --> 1
2 --> 10
Input: n = 5
Output: [0,1,1,2,1,2]
Explanation:
0 --> 0
1 --> 1
2 --> 10
3 --> 11
4 --> 100
5 --> 101
=end

# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
  # O(n), O(n)
  dp = Array.new(n+1) { 0 }
  offset = 1

  (1..n).each do |i|
    # same pattern repeats per offset, offset is multiples of two
    # dp[current_i] would be 1 + (number at current_i minus the offset)
    offset = i if offset * 2 == i
    dp[i] = 1 + dp[i - offset]
  end
  dp
end
