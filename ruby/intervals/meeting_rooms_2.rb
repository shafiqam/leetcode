require 'lintcode/Interval'

# Definition of Interval:
# class Interval
#   attr_accessor :start, :end
#   def initialize(_start=0, _end=0)
#     @start, @end = _start, _end
#   end
# end

class Solution
  # @param intervals: an array of meeting time intervals
  # @return: the minimum number of conference rooms required
  def min_meeting_rooms(intervals)
    # O(nlogn), O(n)
    starts = intervals.select { |obj| obj.start }.sort!
    ends = intervals.select { |obj| obj.end }.sort!

    curr_count, max_count = 0, 0
    s, e = 0, 0
    # looping till start array is done, since start values would start first and end first
    while s < starts.length
      if starts[s] < ends[e]
        s += 1
        curr_count += 1
      else
        e += 1
        curr_count -= 1
      end
      # update max_count with curr_count in every iteration
      max_count = [max_count, curr_count].max
    end
    max_count
  end
end
