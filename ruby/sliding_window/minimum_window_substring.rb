# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  # O(s+t), O(s) + O(t)
  return '' if t.empty? || t.length > s.length

  # intializing count for the need case
  count_t = Hash.new(0)
  t.each_char do |c|
    count_t[c] += 1
  end

  l, r = 0, 0
  result = []
  result_len = s.length + 1 # kind of like an infinity case

  have, need = 0, count_t.length # need is unique chars count, not total
  count_window = Hash.new(0)
  while r < s.length
    c = s[r]
    count_window[c] += 1

    # update have only if char count in both window and t are same
    have += 1 if count_t.key?(c) && count_window[c] == count_t[c]

    # we found a valid substring
    while have == need
      # update result indices if window length is smaller than existing result_len
      if (r-l+1) < result_len
        result = [l, r]
        result_len = (r-l+1)
      end

      # breaking clause: decrement have if count_window of char is less than count_t
      count_window[s[l]] -= 1
      have -= 1 if count_t.key?(s[l]) && count_window[s[l]] < count_t[s[l]]
      l += 1
    end

    r += 1
  end
  l, r = result[0], result[1]
  (result_len != s.length + 1) ? s[l..r] : ''
end
