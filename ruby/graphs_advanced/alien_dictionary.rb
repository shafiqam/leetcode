# @param words: a list of words
# @return: a string which is correct order
def alien_order(words)
  # O(n), O(n), n: number of unique chars in the words
  adj_list = Hash.new { |h,k| h[k] = Set.new }

  visited = {} # visited = false, visited + current_path = true
  res = []

  # post order dfs for cycle detection
  dfs = lambda do |c|
    return visited[c] if visited.key?(c)

    visited[c] = true
    adj_list[c].each do |neighbor|
      # return with true means there is a cycle
      return true if dfs.call(neighbor)
    end
    visited[c] = false

    # append char to result since its only visited
    res.append(c)
  end

  # get word pair to compare characters
  for i in 0..words.length-2
    w1, w2 = words[i], words[i+1]
    min_len = [w1, w2].min

    # its not sorted by rules of new language
    return "" if w1[0..min_len] == w2[0..min_len] && w1.length > w2.length

    # add the char to the adj list when the chars are different
    for j in 0..min_len-1
      next if w1[j] == w2[j]
      adj_list[w1[j]].add(w2[j])
    end
  end

  adj_list.keys.each do |c|
    return "" if dfs.call(c) # cycle detected
  end

  # if no cycle
  res.reverse.join
end
