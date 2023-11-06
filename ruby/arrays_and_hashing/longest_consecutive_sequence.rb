# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  # O(n), O(n)
  set = Set.new(nums)
  longest = 0
  nums.each do |n|
    # start of sequence
    if !set.include? (n-1)
      len = 1
      while set.include? (n+1)
        len += 1
        n += 1
      end
      longest = [longest, len].max
    end
  end
  longest
end
