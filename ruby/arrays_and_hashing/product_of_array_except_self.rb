# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  # O(n), O(1)
  arr = []
  len = nums.length
  # run 2 passes l->r (prefix), r->l (postfix)
  # prefix run
  pre = 1
  nums.each_with_index do |_, index|
      arr[index] = pre
      pre = pre * nums[index]
  end
  # p arr
  # postfix run
  post = 1
  (len-1).downto(0) do |index|
      arr[index] = arr[index] * post
      post = post * nums[index]
  end
  # p arr
  arr
end
