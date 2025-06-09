# @param {Integer[][]} intervals
# @return {Integer}
def erase_overlap_intervals(intervals)
  # O(nlogn), O(1)
  intervals.sort!

  count = 0
  prev_end = intervals[0][1]
  for s, e in intervals[1..-1]
    # not overlapping, update prev_end
    if prev_end <= s
      prev_end = e
    else # overlapping
      count += 1
      prev_end = [prev_end, e].min
    end
  end
  count
end
