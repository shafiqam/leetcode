# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  # O(n), O(n)
  hash = {}
  nums.each do |n|
    return true if hash.key? n
    hash[n] = true
  end && false
end
