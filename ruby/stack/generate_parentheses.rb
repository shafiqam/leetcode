=begin
https://leetcode.com/problems/generate-parentheses/description/
Given n pairs of parentheses, write a function to generate all combinations of well-formed
parentheses.
Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]
Input: n = 1
Output: ["()"]
=end

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  # O(2^n), O(n)
  stack = []
  result = []

  build = lambda do |open_count, closed_count|
    # valid combination if open == closed == n
    if open_count == closed_count && open_count == n
      result << stack.join('')
      return
    end

    # add open if open < n
    if open_count < n
      stack << '('
      build.call(open_count + 1, closed_count)
      stack.pop
    end

    # add closed if closed < open
    if closed_count < open_count
      stack << ')'
      build.call(open_count, closed_count + 1)
      stack.pop
    end
  end

  build.call(0, 0)
  result
end
