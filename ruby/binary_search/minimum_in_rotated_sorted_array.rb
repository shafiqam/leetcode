# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  # O(logn), O(1)
  l, r = 0, nums.length-1
  min_num = nums[0]
  while l <= r
    # sorted subarray, return of min of (current_min, leftmost)
    return [min_num, nums[l]].min if nums[l] <= nums[r]

    mid = (l+r)/2
    # keep updating min until we find the sorted subarray
    min_num = [min_num, nums[mid]].min

    if nums[l] <= nums[mid]
      l = mid + 1
    else
      r = mid - 1
    end
  end
  min_num
end
