=begin
https://leetcode.com/problems/min-stack/description/
Design a stack that supports push, pop, top, and retrieving the minimum element in constant
time. Implement the MinStack class:
MinStack() initializes the stack object.
void push(int val) pushes the element val onto the stack.
void pop() removes the element on the top of the stack.
int top() gets the top element of the stack.
int getMin() retrieves the minimum element in the stack.
You must implement a solution with O(1) time complexity for each function.
Input
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]
Output
[null,null,null,null,-3,null,0,-2]
Explanation
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin(); // return -3
minStack.pop();
minStack.top();    // return 0
minStack.getMin(); // return -2
=end

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
