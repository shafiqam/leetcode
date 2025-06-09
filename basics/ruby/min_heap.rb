class MinHeap
  attr_accessor :arr

  def initialize()
    @arr = []
  end

  def push(val)
    arr.push(val)
    parent_index = parent(arr.length-1)
    sift_up(parent_index)
  end

  def pop
    return nil if arr.length == 0

    smallest_value = arr[0]
    arr[0] = arr.pop # pop the last one and add it to the top-most place
    sift_down(0)

    smallest_value
  end

  def peek
    arr[0]
  end

  private

  def left(idx)
    2 * idx + 1
  end

  def right(idx)
    2 * idx + 2
  end

  def parent(idx)
    (idx - 1) / 2
  end

  # return the index of the lowest in the triangle (node, left, right)
  def heapify(idx)
    l = left(idx)
    r = right(idx)

    # compare index with parent, left and right positions and assign a new lowest
    lowest = idx
    lowest = l if arr[l] && arr[l] < arr[lowest]
    lowest = r if arr[r] && arr[r] < arr[lowest]

    return if lowest == idx # idx is already the lowest

    arr[idx], arr[lowest] = arr[lowest], arr[idx]
    lowest # swap and return the new lowest
  end

  def sift_up(idx)
    lowest = heapify(idx)
    sift_up(parent(idx)) if lowest && idx > 0
  end

  def sift_down(idx)
    lowest = heapify(idx)
    sift_down(lowest) if lowest
  end
end

#                 [0] 5
#       [1] 20             [2] 10
#  [3] 30   [4] 80     [5] 60   [6] 50
# Debug
mh = MinHeap.new()
mh.push(5)
mh.push(20)
mh.push(10)
mh.push(30)
mh.push(80)
mh.push(60)
mh.push(50)
p mh.peek # 5
p mh # [5, 20, 10, 30, 80, 60, 50]
mh.push(3) # 3
p mh.peek
p mh # [3, 5, 10, 20, 80, 60, 50, 30]
#          3
#      5       10
#   20  80    60  50
# 30
mh.pop
p mh.peek # 5
p mh # [5, 20, 10, 30, 80, 60, 50]
#          5
#     20       10
#   30  80   60  50
