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
  # @return: if a person could attend all meetings
  def can_attend_meetings(intervals)
    # O(nlogn), O(1)
    intervals.sort_by { |obj| obj.start }

    for i in (1..intervals.length-1)
      return false if intervals[i-1].end > intervals[i].start
    end
    true
  end
end
