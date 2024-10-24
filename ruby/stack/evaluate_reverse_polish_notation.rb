=begin
https://leetcode.com/problems/evaluate-reverse-polish-notation/description/
You are given an array of strings tokens that represents an arithmetic expression in a
Reverse Polish Notation. Evaluate the expression. Return an integer that represents the
value of the expression. Note that:
1. The valid operators are '+', '-', '*', and '/'.
2. Each operand may be an integer or another expression.
3. The division between two integers always truncates toward zero.
4. There will not be any division by zero.
5. The input represents a valid arithmetic expression in a reverse polish notation.
6. The answer and all the intermediate calculations can be represented in a 32-bit integer.
Input: tokens = ["2","1","+","3","*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9
Input: tokens = ["4","13","5","/","+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6
Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
Output: 22
Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
= ((10 * (6 / (12 * -11))) + 17) + 5
= ((10 * (6 / -132)) + 17) + 5
= ((10 * 0) + 17) + 5
= (0 + 17) + 5
= 17 + 5
= 22
=end

# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  # O(n), O(n)
  stack = []
  operators = ['+', '-', '*', '/']

  tokens.each do |t|
    # if operator, pop last 2, evaluate and add back to stack
    # pop order important for -, /. First pop is right, second is left
    if operators.include?(t)
      right = stack.pop
      left = stack.pop
      # added it separately for clarity, division needs to truncate to zero
      left = left.to_f if (t == '/')
      expression = "#{left} #{t} #{right}"
      result = eval(expression)
      stack << result.to_i
    else
      stack << t.to_i
    end
  end
  stack.pop
end
