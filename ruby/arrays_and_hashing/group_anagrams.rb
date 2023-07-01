# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  # O(m.n.26) ~ O(m.n), O(m) + O(n)
  # m -> length of input strs[], n -> avg length of each str
  anagrams = Hash.new { |h,k| h[k] = [] }
  strs.each do |str|
    hash = Hash.new(0)
    str.each_char do |c|
      hash[c] += 1
    end
    anagrams[hash] << str
  end
  anagrams.values
end
