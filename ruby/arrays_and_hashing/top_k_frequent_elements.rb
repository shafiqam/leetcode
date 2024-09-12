# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  # O(n) + O(k), O(n)
  return [] if k == 0

  hash = Hash.new(0)
  # max_freq = 0
  nums.each do |n|
    hash[n] += 1
    # max_freq = [max_freq, hash[n]].max
  end
  max_freq = hash.values.max
  # create array with count as indices
  # size of max_freq+1 to offset start with 0
  arr = Array.new(max_freq + 1) { [] }
  hash.each do |k, v|
    arr[v] << k
  end
  # iterate in reverse order and add until we reach top_k elements
  top_k = []
  max_freq.downto(1) do |index|
    arr[index].each do |x|
      top_k << x
      k -= 1
    end
    return top_k if k == 0 ## test this
  end
  top_k
end
