=begin
Given an unsorted array of integers nums, return the length of the longest consecutive
elements sequence. You must write an algorithm that runs in O(n) time.
Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9
=end

# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  # O(n), O(n)
  set = Set.new(nums)
  longest = 0
  set.each do |n|
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
