=begin
https://leetcode.com/problems/reverse-bits/description/
Reverse bits of a given 32 bits unsigned integer.
Input: n = 00000010100101000001111010011100
Output:    964176192 (00111001011110000010100101000000)
Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer
43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.
Input: n = 11111111111111111111111111111101
Output:   3221225471 (10111111111111111111111111111111)
Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer
4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111.
=end

# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  # O(1), O(1)
  res = 0
  (0..31).each do |i|
    bit = (n >> i) & 1 # get most significant bit
    res = res | (bit << (31 - i)) # OR the bit in the reverse order
  end
  res
end
