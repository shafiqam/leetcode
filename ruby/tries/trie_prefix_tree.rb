# class Node
#   attr_accessor :children, :end_of_word
#   def initialize()
#     @children = {}
#     @end_of_word = false
#   end
# end

class Trie
  def initialize()
    @root = Node.new
  end


=begin
  :type word: String
  :rtype: Void
=end
  def insert(word)
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
    # O(k), k: string length
    curr = @root

    word.each_char do |c|
      return false unless curr.children.key? c
      curr = curr.children[c]
    end
    curr.end_of_word
  end


=begin
  :type prefix: String
  :rtype: Boolean
=end
  def starts_with(prefix)
    # O(k), k: prefix length
    curr = @root

    prefix.each_char do |c|
       return false unless curr.children.key? c
       curr = curr.children[c]
    end
    true
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
