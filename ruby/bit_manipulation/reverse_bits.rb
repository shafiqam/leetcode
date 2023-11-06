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
