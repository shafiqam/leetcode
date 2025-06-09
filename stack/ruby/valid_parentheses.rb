=begin
https://leetcode.com/problems/valid-parentheses/description/
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine
if the input string is valid. An input string is valid if:
1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.
3. Every close bracket has a corresponding open bracket of the same type.
Input: s = "()"
Output: true
Input: s = "()[]{}"
Output: trueInput: s = "(]"
Output: false
Input: s = "([])"
Output: true
=end

# @param {String} s
# @return {Boolean}
def is_valid(s)
  # O(n), O(n)
  stack = []
  # this notation keeps keys as strings, ':' notation stores keys as symbols
  hash = { '(' => ')', '[' => ']', '{' => '}' }
  s.each_char do |c|
    if hash.key? c
      stack << c
    else
      return false if stack.empty?
      return false if hash[stack.pop] != c
    end
  end
  stack.empty?
end
