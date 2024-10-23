=begin
https://leetcode.com/problems/group-anagrams/description/
Given an array of strings strs, group the anagrams together. You can return the
answer in any order.
Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
Explanation: There is no string in strs that can be rearranged to form "bat".
The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
Input: strs = [""]
Output: [[""]]
Input: strs = ["a"]
Output: [["a"]]
=end

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  # O(m.n.26) ~ O(m.n), O(m) + O(n)
  # m -> length of input strs[], n -> max length of each str
  anagrams = Hash.new { |h,k| h[k] = [] }
  strs.each do |str|
    hash = Hash.new(0)
    str.each_char do |c|
      hash[c] += 1
    end
    anagrams[hash] << str
  end
  anagrams.values
end
