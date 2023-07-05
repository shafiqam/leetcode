# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # O(n), O(n)
  return 0 if s.length == 0
  return 1 if s.length == 1

  hash = {}
  substr = []
  longest = 0
  s.each_char do |c|
    if hash.key? c
      # keep deleting from hash until char c (duplicate is removed)
      # we want contiguous non-repeating char substring
      hash.delete(substr.shift) while hash.key? c
    end
    substr << c
    hash[c] = true
    longest = [longest, substr.length].max
  end
  longest
end
