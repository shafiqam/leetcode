=begin
https://leetcode.com/problems/sum-of-two-integers/description/
Given two integers a and b, return the sum of the two integers without using the operators + and -.
=end

# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def get_sum(a, b)
  # O(1), O(1)
  ### logic
  # while b != 0
  #   carry = (a & b) << 1
  #   a = a ^ b
  #   b = carry
  # end
  # a

  # avoid time limit
  mask = 0xffffffff
  while b != 0 # until no carries left
    tmp = (a & b) << 1 # carries
    a = (a ^ b) & mask # addition w/o carries
    b = tmp & mask
  end
  a = ~(a ^ mask) if a > (mask >> 1)
  a
end
