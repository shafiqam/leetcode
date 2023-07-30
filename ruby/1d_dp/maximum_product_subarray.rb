# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  # O(n), O(1)
  largest_product = nums[0]
  curr_min, curr_max = 1, 1

  nums.each do |n|
    # since curr_max is being updated before being used in curr_min calculation
    temp_max = curr_max

    curr_max = [curr_max * n, curr_min * n, n].max # 'n' too since cases like [-1, 8]
    curr_min = [temp_max * n, curr_min * n, n].min # 'n' too since cases like [-1, -8]
    largest_product = [largest_product, curr_max].max
  end
  largest_product
end
