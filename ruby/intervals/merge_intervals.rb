# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  # O(nlogn), O(1)
  intervals = intervals.sort_by { |i| i[0] }
  # intervals.sort! # 2D arrays can be sorted as such too

  result = [intervals[0]]
  for i in intervals[1..intervals.length-1]
    last_intervals_end = result[-1][1]

    # if the last_intervals_end is greater than curr intervals start, they overlap
    if last_intervals_end >= i[0]
      # update last intervals end to max of itself and curr interval
      result[-1][1] = [last_intervals_end, i[1]].max
    else
      # no overlap, append the curr interval to list
      result << i
    end
  end
  result
end
