# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  # O(logn), O(1)
  l, r = 0, nums.length-1
  while l <= r
    mid = (l+r)/2
    if nums[mid] < target
      l = mid + 1
    elsif nums[mid] > target
      r = mid - 1
    else
      return mid
    end
  end
  return -1
end

# recursive solution
# def search(nums, target)
#   # O(logn), O(1)
#   return -1 if nums.empty?

#   mid = nums.length/2
#   if nums[mid] == target
#     mid
#   elsif nums[mid] < target
#     index = search(nums[mid+1..-1], target)
#     index == -1 ? -1 : mid+1+index # add mid+1 to offset index, since second half
#   else nums[mid] > target
#     return -1 if mid-1 < 0 # ruby [0..-1] is a valid case and keeps looping
#     return search(nums[0..mid-1], target)
#   end
# end
