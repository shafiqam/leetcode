# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  # O(n^2 * m) O(n), n: s.length, m: word_dict.length
  len = s.length
  dp = Array.new(len+1) { false }

  dp[len] = true
  (len-1).downto(0) do |i|
    for w in word_dict
      # consider only if substring is same or of greater length than word
      if (i + w.length) <= len && s[i..(i + w.length - 1)] == w
        dp[i] = dp[i + w.length]

        # break out of this loop if a word is found,
        # no need to check other words, move onto next substring
        break if dp[i]
      end
    end
  end
  dp[0]
end
