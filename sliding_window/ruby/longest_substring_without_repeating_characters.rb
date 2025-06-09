=begin
https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
Given a string s, find the length of the longest substring without repeating characters.
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
=end

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # O(n), O(n)
  l, r = 0, 0
  hash = {}
  longest = 0

  while r < s.length
    c = s[r]
    # window is invalid if it has a repeating char
    # keep deleting from hash until char c (duplicate is removed)
    # we want contiguous non-repeating char substring
    # eg; abcbb
    while hash.key? c
      hash.delete(s[l])
      l += 1
    end
    hash[c] = true
    longest = [longest, (r - l + 1)].max
    r += 1
  end
  longest
end
