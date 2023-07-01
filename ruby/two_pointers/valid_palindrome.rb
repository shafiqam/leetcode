# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  # O(n), O(1)
  s = s.downcase.gsub(/[^a-z0-9]/, '')
  l, r = 0, s.length-1
  while l < r do
    # if cannot use regex
    # l += 1 while l<r && !is_alphanum(s[l])
    # r -= 1 while l<r && !is_alphanum(s[r])
    return false if s[l] != s[r]
    l, r = l+1, r-1
  end
  true
end

def is_alphanum(c)
  ((c.ord >= 'a'.ord && c.ord <= 'z'.ord) ||
   (c.ord >= 'A'.ord && c.ord <= 'Z'.ord) ||
   (c.ord >= '0'.ord && c.ord <= '9'.ord))
end
