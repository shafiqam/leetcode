# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  # O(n), O(n)
  result = []

  intervals.each_with_index do |i, index|
    # if new interval is before curr interval
    if new_interval[1] < i[0]
      result << new_interval
      return result.concat(intervals[index..-1])
    # if new interval is after the curr interval
    elsif new_interval[0] > i[1]
      result << i
    # if new interval overlaps, update new interval parameters
    else
      new_interval = [[new_interval[0], i[0]].min, [new_interval[1], i[1]].max]
    end
  end

  # through the loop, we neever added the overlapping interval, doing that here
  result << new_interval
  result
end
