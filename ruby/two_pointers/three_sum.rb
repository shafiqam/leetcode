# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  # O(nlogn) + O(n.n) ~ O(n^2), O(1)
  nums.sort!

  result = []
  len = nums.length
  (0...len).each do |i|
    # skip if in sorted next elem is same as previous elem, avoid duplicate triplets
    # also skip if index is second last elem since triplets, only scan till 3rd last
    next if (i > 0 && nums[i] == nums[i-1]) || i == len-1
    a = nums[i]
    target = -1 * a

    # solve two_sum 2
    l = i + 1
    r = len - 1
    while l < r
      if nums[l] + nums[r] < target
        l += 1
      elsif nums[l] + nums[r] > target
        r -= 1
      else
        result << [a, nums[l], nums[r]]
        l += 1
        l += 1 while l < r && nums[l] == nums[l-1]
      end
    end
  end
  result
end
