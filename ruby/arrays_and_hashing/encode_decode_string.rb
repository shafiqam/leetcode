=begin
https://leetcode.com/problems/encode-and-decode-strings/description/
Design an algorithm to encode a list of strings to a single string. The encoded
string is then decoded back to the original list of strings. Please implement
encode and decode methods.
Input: ["neet","code","love","you"]
Output:["neet","code","love","you"]
Input: ["we","say",":","yes"]
Output: ["we","say",":","yes"]
=end

# Encodes a list of strings to a single string.
#
# @param {string[]} strs
# @return {string}
def encode(strs)
  # O(n), O(1)
  result = ""
  strs.each do |str|
    result += "#{str.length}##{str}"
  end
  result
end

# Decodes a single string to a list of strings.
#
# @param {string} s
# @return {string[]}
def decode(s)
  # O(n), O(1)
  l, r = 0, 0
  result = []
  # ['cat', 'rats']
  # 3#cat4#rats
  while r < s.length
    if s[r] == '#'
      len = s[l...r].to_i
      str = s[(r + 1)...((r + 1) + len)]
      l = (r + 1) + len
      r = l
      result << str
    else
      r += 1
    end
  end
  result
end

# Your functions will be called as such:
# decode(encode(strs))
