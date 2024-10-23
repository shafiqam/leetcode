=begin
https://leetcode.com/problems/top-k-frequent-elements/description/
Given an integer array nums and an integer k, return the k most frequent elements.
You may return the answer in any order.
Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]
Input: nums = [1], k = 1
Output: [1]
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  # O(n + k) ~ O(n), O(n)
  # base case
  return [] if k == 0

  # frequent elems -> count the chars -> hash
  hash = Hash.new(0)
  nums.each do |n|
    hash[n] += 1
  end

  # create array with count as indices, value as number(s)
  max_freq = hash.values.max
  arr = Array.new(max_freq + 1) { [] } # size of max_freq+1 to offset start with 0
  hash.each do |k, v|
    arr[v] << k
  end

  # iterate in reverse order and add until we reach top_k elements
  top_k = []
  max_freq.downto(1) do |index|
    arr[index].each do |x|
      top_k << x
      k -= 1
      return top_k if k == 0
    end
  end
  top_k
end
