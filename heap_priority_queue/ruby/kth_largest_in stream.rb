# Leetcode does not like using 'rb_heap' gem
# so, going to use the algorithm gem instead

class KthLargest
=begin
  :type k: Integer
  :type nums: Integer[]
=end
  def initialize(k, nums)
    # O((n-k)logn) ~ O(nlogk), O(k)
    @heap = MinHeap.new([])
    @k = k
    nums.each do |n|
      add(n)
    end
  end

=begin
  :type val: Integer
  :rtype: Integer
=end
  def add(val)
    # O(logn), O(1)
    @heap.push(val)
    @heap.pop if @heap.size > @k

    @heap.min
  end
end

# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest.new(k, nums)
# param_1 = obj.add(val)

###
### RB_HEAP SOLUTION
###
# require 'rb_heap'

# class KthLargest
# =begin
#   :type k: Integer
#   :type nums: Integer[]
# =end
#   def initialize(k, nums)
#     # O((n-k)logn) ~ O(nlogn), O(k)
#     # min heap intialization
#     # kth largest element would be the min of the size k set,
#     # using min heap of size k, would be perfect for this.
#     @heap = Heap.new(:<)
#     @k = k
#     nums.each do |n|
#       add(n) # call defined add method
#     end
#   end

# =begin
#   :type val: Integer
#   :rtype: Integer
# =end
#   def add(val)
#     # O(logn), O(1)
#     @heap.add(val)
#     @heap.pop if @heap.size > @k

#     @heap.peak
#   end
# end
