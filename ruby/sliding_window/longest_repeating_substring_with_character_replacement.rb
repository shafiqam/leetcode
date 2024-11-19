=begin
https://leetcode.com/problems/longest-repeating-character-replacement/description/
You are given a string s and an integer k. You can choose any character of the string and
change it to any other uppercase English character. You can perform this operation at
most k times. Return the length of the longest substring containing the same letter you
can get after performing the above operations.
Input: s = "ABAB", k = 2
Output: 4
Explanation: Replace the two 'A's with two 'B's or vice versa.
Input: s = "AABABBA", k = 1
Output: 4
Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.
There may exists other ways to achieve this answer too.
=end

# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
  # O(n), O(26.n) ~ O(n)
  l, r = 0, 0
  hash = Hash.new(0) # alphabets count
  longest = 0

  while r < s.length
    hash[s[r]] += 1
    # window validity condition
    # (length of window - max of hash values) <= k
    if ((r - l + 1) - hash.values.max) > k
      hash[s[l]] -= 1 # keep accurate count of new window
      l += 1
    end
    longest = [longest, r - l + 1].max
    r += 1
  end
  longest
end
