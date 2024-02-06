# class Node
#   attr_accessor :children, :end_of_word
#   def initialize()
#     @children = {}
#     @end_of_word = false
#   end
# end

class WordDictionary
  def initialize()
    @root = Node.new
  end


=begin
  :type word: String
  :rtype: Void
=end
  def add_word(word)
    # O(k), k: string length
    curr = @root

    word.each_char do |c|
      curr.children[c] = Node.new unless curr.children.key? c
      curr = curr.children[c]
    end
    curr.end_of_word = true
  end


=begin
  :type word: String
  :rtype: Boolean
=end
  def search(word)
    # O(26^k), k: string length
    dfs = lambda do |index, root|
      curr = root
      len = word.length

      (index..len-1).each do |i|
        c = word[i]

        if c == '.'
          # check all possible (26) options, return true if matches atleast one
          # k-v: char-Node; so we need nodes not the chars; so values
          curr.children.values.each do |child|
            return true if dfs.call(i+1, child)
          end
          # if we reach here, then none of the possible paths, matched the word
          return false
        else
          return false unless curr.children.key? c
          curr = curr.children[c]
        end
      end
      curr.end_of_word
    end

    dfs.call(0, @root)
  end
end

# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary.new()
# obj.add_word(word)
# param_2 = obj.search(word)
