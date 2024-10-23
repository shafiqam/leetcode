=begin
https://leetcode.com/problems/valid-anagram/description/
Given two strings s and t, return true if t is an anagram of s, and false otherwise.
Input: s = "anagram", t = "nagaram"
Output: true
Input: s = "rat", t = "car"
Output: false
=end

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.length != t.length
  # sort O(nlogn), O(1)
  # sorted_s = s.chars.sort.join
  # sorted_t = t.chars.sort.join
  # return sorted_s == sorted_t

  # O(s+t), O(s+t) ~ O(n), O(n)
  # hashmap, count the chars
  hash = Hash.new(0)
  s.chars.each_with_index do |_, index|
    hash[s[index]] += 1
    hash[t[index]] -= 1
  end
  hash.values.all? { |x| x.zero? }
end
