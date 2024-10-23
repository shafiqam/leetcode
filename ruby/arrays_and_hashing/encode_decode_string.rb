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
  # O(1), O(1)
  result = ""
  strs.each do |str|
    result.concat "#{str.length}##{str}"
  end
  result
end

# Decodes a single string to a list of strings.
#
# @param {string} s
# @return {string[]}
def decode(s)
  # O(n), O(1)
  i = 0
  result = []
  # ['cat', 'rats']
  # 3#cat4#rats
  while i < s.length
    j = i
    if s[j] == '#'
      str_len = s[i..(j-1)].to_i
      result << s[(j + 1)...((j + 1) + str_len)]

      i = (j + 1) + str_len
    else
      j += 1
    end
  end
  result
end

# Your functions will be called as such:
# decode(encode(strs))
