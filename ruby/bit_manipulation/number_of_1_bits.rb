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
