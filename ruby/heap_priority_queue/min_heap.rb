class MinHeap
def initialize()
  @data = []
end

def push(val)
  @data.push(val)
  parent_index = parent(@data.length-1)
  sift_up(parent_index)
end

def pop
  return nil if @data.length == 0

  smallest_value = @data[0]
  @data[0] = @data.pop
  sift_down(0)

  smallest_value
end

def peak
  @data[0]
end

private

  def left(i)
    2 * i + 1
  end

  def right(i)
    2 * i + 2
  end

  def parent(i)
    (i - 1) / 2
  end

  def heapify(i)
    l = left(i)
    r = right(i)

    head = i
    head = l if @data[l] && @data[l] < @data[head]
    head = r if @data[r] && @data[r] < @data[head]

    return if head == i

    @data[i], @data[head] = @data[head], @data[i]
    head
  end

  def sift_up(i)
    head = heapify(i)
    sift_up(parent(i)) if head && i > 0
  end

  def sift_down(i)
    head = heapify(i)
    sift_down(head) if head
  end
end
