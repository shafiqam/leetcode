=begin
https://leetcode.com/problems/permutation-in-string/description/
Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.
In other words, return true if one of s1's permutations is the substring of s2.
Input: s1 = "ab", s2 = "eidbaooo"
Output: true
Explanation: s2 contains one permutation of s1 ("ba").
Input: s1 = "ab", s2 = "eidboaoo"
Output: false
=end

# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
  # O(26) + O(n) ~ O(n), O(1)
  return false if s1.length > s2.length

  s1_count = Hash.new(0)
  s2_count = Hash.new(0)

  # update count of chars in each s1 and s2 respectively until s1 length
  index = 0
  while index < s1.length
    s1_count[s1[index]] += 1
    s2_count[s2[index]] += 1
    index += 1
  end

  # count all chars in s1 that match with s2
  matches = 0
  ('a'..'z').to_a.each do |char|
    matches += 1 if s1_count[char] == s2_count[char]
  end

  # check the remaining s2 until we find all 26 matches
  # ie, search for window which is a permutation of s1 (keeping same window size)
  l, r = 0, s1.length # current window size, slide it from here, searching for matches
  while r < s2.length
    # if reached required matches
    return true if matches == 26

    # add a char on the right
    char = s2[r]
    s2_count[char] += 1
    if s1_count[char] == s2_count[char] # find a match
        matches += 1
    elsif s1_count[char] + 1 == s2_count[char] # find a mismatch
        matches -= 1
    end
    r += 1

    # remove a char on the left
    char = s2[l]
    s2_count[char] -= 1
    if s1_count[char] == s2_count[char] # find a match
        matches += 1
    elsif s1_count[char] - 1 == s2_count[char] # find a mismatch
        matches -= 1
    end
    l += 1
  end
  matches == 26 # true if all char count match
end
