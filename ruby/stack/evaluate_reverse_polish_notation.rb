# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  # O(n), O(n)
  stack = []
  tokens.each do |t|
    # if operator, pop last 2, evaluate and add back to stack
    # pop order important for -, /. First pop is right, second is left
    if t == '+' || t == '-' || t == '*' || t == '/'
      right = stack.pop
      left = stack.pop
      # added it separately for clarity, division needs to truncate to zero
      expression = (t == '/') ? "#{left.to_f} #{t} #{right}" : "#{left} #{t} #{right}"
      result = eval(expression)
      stack << result.to_i
    else
      stack << t.to_i
    end
  end
  stack.pop
end
