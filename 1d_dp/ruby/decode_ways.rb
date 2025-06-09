# @param {String} s
# @return {Integer}
def num_decodings(s)
  # O(n), O(n)
  len = s.length
  dp = Array.new(len+1) { 1 }

  # breaking into subproblems,
  # where 1 + decode starting at remaining substring
  (len-1).downto(0) do |i|
    # if starting at 0, invalid
    if s[i] == '0'
      dp[i] = 0
    else
      # starting with 1-9, add the cached value
      # array already defaulted to 1 (so handles the 1 way to decode)
      # also, this is the split the curr char into 1 digit
      dp[i] = dp[i+1]
    end

    # if we decide to split it into 2-digit char
    # can only split if follows inbound, starting 1
    # or starting with 2 and ending with 1-6
    if (i+1) < len &&
       (s[i] == '1' || (s[i] == '2' && '0123456'.include?(s[i+1])))
      dp[i] += dp[i+2]
    end
  end

  dp[0]
end
