=begin
https://leetcode.com/problems/daily-temperatures/description/
Given an array of integers temperatures represents the daily temperatures, return an array answer
such that answer[i] is the number of days you have to wait after the ith day to get a warmer
temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.
Input: temperatures = [73,74,75,71,69,72,76,73]
Output: [1,1,4,2,1,1,0,0]
Input: temperatures = [30,40,50,60]
Output: [1,1,1,0]
Input: temperatures = [30,60,90]
Output: [1,1,0]
=end

# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  # O(n), O(n)
  answer = Array.new(temperatures.length) { 0 }
  stack = [] # stores a tuple [temp, index]

  temperatures.each_with_index do |temp, index|
      # when we find a warmer temp, pop from stack
      while !stack.empty? && temp > stack[-1][0]
          _, prev_index = stack.pop

          # no. of days it took to find a greater temp
          answer[prev_index] = index - prev_index
      end
      stack << [temp, index]
  end
  answer
end
