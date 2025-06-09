=begin
https://leetcode.com/problems/number-of-1-bits/description/
Write a function that takes the binary representation of a positive integer and returns the number of
set bits it has (also known as the Hamming weight).
Input: n = 11
Output: 3
Explanation: The input binary string 1011 has a total of three set bits.
Input: n = 128
Output: 1
Explanation: The input binary string 10000000 has a total of one set bit.
=end

# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  count = 0
  while n > 0
    # solution 1
    # O(1), O(1), loops till number of digits in number
    # count += n % 2
    # n = n >> 1 # n = n/2

    # solution 2 (better)
    # O(1), O(1), loops only till number of 1 bits
    n = n & (n-1)
    count += 1
  end
  count
end
