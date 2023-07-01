# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  # O(n), O(n)
  hash = {} # val: index
  solutions_arr = []
  nums.each_with_index do |val, index|
      diff = target - val
      if hash.key? diff
          return [hash[diff], index]
      end
      hash[val] = index
  end
end
