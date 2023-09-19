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
  len = s.length
  i = 0
  result = []
  # ['cat', 'rats']
  # 3#cat4#rats
  while i < len
    j = i
    if s[j] == '#'
      str_len = s[i..(j-1)].to_i
      result << s[(j + 1)...(j + str_len + 1)]

      i = j + str_len + 1
    end
  end
  result
end

# Your functions will be called as such:
# decode(encode(strs))
