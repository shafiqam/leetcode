# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  # O(n), O(1)
  full, missing = 0, 0
  (0..nums.length).each do |n|
    full ^= n
  end
  nums.each do |n|
    missing ^= n
  end
  full ^ missing

  # O(n), O(1)
  # sum = nums.length * (nums.length + 1) * 0.5 # guass formula (n*(n+1))/2
  # nums.each do |n|
  #   sum -= n
  # end
  # sum.to_i
end
