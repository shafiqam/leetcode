# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
  # O(m * n), O(m * n)
  # initialize array with 0s with one extra row, col to avoid edge case
  len1 = text1.length
  len2 = text2.length
  dp = Array.new(len1+1) { Array.new(len2+1) { 0 } }

  # bottom up dp solution
  (len1-1).downto(0) do |i|
    (len2-1).downto(0) do |j|
      # if chars are same 1 + diagnolly down
      if text1[i] == text2[j]
        dp[i][j] = 1 + dp[i+1][j+1]
      # if chars are not same, max of right and bottom
      else
        dp[i][j] = [dp[i][j+1], dp[i+1][j]].max
      end
    end
  end
  dp[0][0]
end
