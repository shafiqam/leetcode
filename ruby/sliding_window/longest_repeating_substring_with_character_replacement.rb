# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
  # O(n), O(26.n) ~ O(n)
  hash = Hash.new(0) # alphabets count
  longest = 0
  l, r = 0, 0
  while r < s.length
    hash[s[r]] += 1
    # window validity condition
    # (length of window - max of hash values) <= k
    if ((r-l+1) - hash.values.max) > k
      hash[s[l]] -= 1 # keep accurate count of new window
      l += 1
    end
    longest = [longest, r-l+1].max
    r += 1
  end
  longest
end
