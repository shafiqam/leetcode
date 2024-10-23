=begin
A phrase is a palindrome if, after converting all uppercase letters into lowercase letters
and removing all non-alphanumeric characters, it reads the same forward and backward.
Alphanumeric characters include letters and numbers. Given a string s, return true if it
is a palindrome, or false otherwise.
Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.
=end

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  # O(n), O(1)
  s = s.downcase.gsub(/[^a-z0-9]/, '')
  l, r = 0, s.length-1
  while l < r
    # if cannot use regex
    # l += 1 while l<r && !is_alphanum(s[l])
    # r -= 1 while l<r && !is_alphanum(s[r])

    return false if s[l] != s[r]
    l += 1
    r -= 1
  end
  true
end

# def is_alphanum(c)
#   ((c.ord >= 'a'.ord && c.ord <= 'z'.ord) ||
#    (c.ord >= 'A'.ord && c.ord <= 'Z'.ord) ||
#    (c.ord >= '0'.ord && c.ord <= '9'.ord))
# end
