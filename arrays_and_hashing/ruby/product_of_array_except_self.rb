=begin
https://leetcode.com/problems/product-of-array-except-self/description/
Given an integer array nums, return an array answer such that answer[i] is equal to the
product of all the elements of nums except nums[i]. The product of any prefix or suffix
of nums is guaranteed to fit in a 32-bit integer. You must write an algorithm that runs
in O(n) time and without using the division operation.
Input: nums = [1,2,3,4]
Output: [24,12,8,6]
Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]
=end

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  # O(n), O(n)
  arr = []
  len = nums.length
  # run 2 passes l->r (prefix), r->l (postfix)
  # prefix run
  pre = 1
  nums.each_with_index do |_, index|
    arr[index] = pre
    pre = pre * nums[index]
  end
  # postfix run
  post = 1
  (len-1).downto(0) do |index|
    arr[index] = arr[index] * post
    post = post * nums[index]
  end
  arr
end
