# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  # O(n + pre), O(n)
  pre_map = Hash.new { |h,k| h[k] = [] }
  prerequisites.each do |crs, pre|
    pre_map[crs].append(pre)
  end

  # visited is all the courses along the current dfs path
  visited = Set.new

  dfs = lambda do |crs|
    return false if visited.include?(crs) # loop exists
    return true if pre_map[crs] == [] # no more prerequisites

    visited.add(crs)
    pre_map[crs].each do |pre|
      # return false if loop detected somewhere in path
      return false unless dfs.call(pre)
    end
    # if it reached here, meaning its possible
    visited.delete(crs)
    # also update preMap value, to not traverse again
    pre_map[crs] = []
    return true
  end

  # iterate through all courses in num_courses
  (0..num_courses-1).each do |crs|
    return false unless dfs.call(crs)
  end
  return true
end
