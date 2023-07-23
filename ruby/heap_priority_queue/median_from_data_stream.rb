class MedianFinder
  def initialize()
    # O(1), O(1)
    # 2 heaps: small (max heap) and large (min heap)
    @small = MaxHeap.new([])
    @large = MinHeap.new([])
  end

=begin
  :type num: Integer
  :rtype: Void
=end
  def add_num(num)
    # O(logn), O(1)
    # add to small heap, by default
    @small.push(num)

    # check if all values in small heap lower than ones in large heap
    # if not, pop from small and add to large
    if (!@small.empty? && !@large.empty? && @small.max > @large.min)
      @large.push(@small.pop)
    end

    # check if size of both heaps are uneven (off by 2), diff is 1 is allowed
    # pop from larger size heap onto smaller sized heap
    if @small.size + 1 < @large.size
      @small.push(@large.pop)
    elsif @small.size > @large.size + 1
      @large.push(@small.pop)
    end
  end

=begin
  :rtype: Float
=end
  def find_median()
    # O(1), O(1)
    # if uneven, return peak from larger sized heap
    # else, find median of peak of both heaps
    if @small.size > @large.size
      @small.max.to_f
    elsif @small.size < @large.size
      @large.min.to_f
    else
      (@small.max.to_f + @large.min)/2
    end
  end
end

# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder.new()
# obj.add_num(num)
# param_2 = obj.find_median()
