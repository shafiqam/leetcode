# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  # O(n), O(1)
  l = 0
  r = numbers.length - 1
  while l < r
    return [l+1, r+1] if (numbers[l] + numbers[r]) == target
    while l < r && (numbers[l] + numbers[r]) < target
      l += 1
    end
    while l < r && (numbers[l] + numbers[r]) > target
      r -= 1
    end
  end
end
