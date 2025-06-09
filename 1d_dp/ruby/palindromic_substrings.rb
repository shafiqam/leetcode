# @param {String} s
# @return {Integer}
def count_substrings(s)
  # O(n^2), O(1)
  count = 0
  len = s.length

  # expand and count the palindromes where condition is valid
  expand = lambda do |l, r|
    while l >= 0 && r < len && s[l] == s[r]
      count += 1
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

  count
end
