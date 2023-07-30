# @param {String} s
# @return {String}
def longest_palindrome(s)
  # O(n^2), O(1)
  substr = ''
  substr_len = 0
  len = s.length

  # expand substr until palindrome
  expand = lambda do |l, r|
    while l >= 0 && r < len && s[l] == s[r]
      # update substr and its length if curr is maximum
      if (r-l+1) > substr_len
        substr = s[l..r]
        substr_len = r-l+1
      end
      l -= 1
      r += 1
    end
  end

  (0..len-1).each do |i|
    # odd case
    expand.call(i, i)

    # even case
    expand.call(i, i+1)
  end

  substr
end
