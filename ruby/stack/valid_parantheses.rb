# @param {String} s
# @return {Boolean}
def is_valid(s)
  # O(n), O(n)
  stack = []
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
