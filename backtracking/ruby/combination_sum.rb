# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  # O(2^t), O(t), t: target (number of elements to reach target)
  result = []

  # use lambda to do recursion
  dfs = lambda do |index, curr, total|
    if total == target
      # here we are adding the duplicate
      # since curr gets updated everytime through recursion
      result << curr.dup
      return
    end

    return if index == candidates.length || total > target

    # if includes curr index value
    curr << candidates[index]
    dfs.call(index, curr, total + candidates[index])

    # else moves onto next index value
    curr.pop # remove added value to go down the excluded path
    dfs.call(index + 1, curr, total)
  end

  dfs.call(0, [], 0)
  result
end
