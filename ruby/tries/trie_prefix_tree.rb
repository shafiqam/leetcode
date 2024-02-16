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
  :rtype: Void
=end
  def remove(word)
    curr = @root
    path = [] # only has parent nodes to avoid edge cases

    word.each_char do |c|
      path << [curr, c] # [parent_node, child_char]

      return unless curr.children.key? c
      curr = curr.children[c]
    end

    # word ended, but end node has children, then mark end_of_word as false
    # else end node doesnt have children, traverse up the path to find deletable node
    if !curr.children.empty?
      curr.end_of_word = false
    else
      # iterate backwards on the path, to find the deletable node
      # node is marked deletable if it has less than 2 children (word path)
      parent_node, child_char = '', ''
      path.reverse.each do |node, c|
        break if node.children.length > 1
        parent_node, child_char = node, c
      end
      # delete the unwanted node by removing from the parent's children list
      parent_node.children.delete(child_char) unless parent_node == ''
    end
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
