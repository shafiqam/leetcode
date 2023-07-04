class MinStack
  def initialize()
    @arr = []
    @min = []
  end


=begin
  :type val: Integer
  :rtype: Void
=end
  def push(val)
    # O(1) time
    @arr << val

    @min << if @min.empty?
      val
    else
      (val < @min.last) ? val : @min.last
    end
  end


=begin
  :rtype: Void
=end
  def pop()
    # O(1) time
    @arr.pop
    @min.pop
  end


=begin
  :rtype: Integer
=end
  def top()
    # O(1) time
    @arr.last
  end


=begin
  :rtype: Integer
=end
  def get_min()
    # O(1) time
    @min.last
  end
end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()
