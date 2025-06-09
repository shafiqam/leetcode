# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
class Node
  attr_accessor :children, :end_of_word

  def initialize
    @children = {}
    @end_of_word = false
  end

  def add(word)
    curr = self

    word.each_char do |c|
      curr.children[c] = Node.new unless curr.children.key? c
      curr = curr.children[c]
    end
    curr.end_of_word = true
  end

  def delete(word)
    curr = self
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
end

def find_words(board, words)
  root = Node.new

  words.each do |w|
    root.add(w)
  end

  rows, cols = board.length, board[0].length
  result, visited = Set.new, Set.new

  dfs = lambda do |r, c, node, word|
    # return if oob OR visited char OR char not in trie node's children
    return if ((r < 0 || c < 0 || r == rows || c == cols) ||
      visited.include?([r,c]) || !node.children.keys.include?(board[r][c]))

    visited.add([r,c])
    node = node.children[board[r][c]]
    word += board[r][c]

    # update result if word found
    if node.end_of_word
      result << word
      root.delete(word)
    end

    dfs.call(r-1, c, node, word)
    dfs.call(r+1, c, node, word)
    dfs.call(r, c-1, node, word)
    dfs.call(r, c+1, node, word)

    visited.delete([r,c]) # since backtracking
  end

  (0..rows-1).each do |r|
    (0..cols-1).each do |c|
      dfs.call(r, c, root, '')
    end
  end

  result.to_a
end
