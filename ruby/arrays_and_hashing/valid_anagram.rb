# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.length != t.length
  # sort O(nlogn), O(1)
  # sorted_s = s.chars.sort.join
  # sorted_t = t.chars.sort.join
  # return sorted_s == sorted_t

  # hashmap, count the chars, O(s+t), O(s+t)
  hash = Hash.new(0)
  s.chars.each.with_index do |_, index|
    hash[s[index]] += 1
    hash[t[index]] -= 1
  end
  hash.values.all? { |x| x.zero? }
end
