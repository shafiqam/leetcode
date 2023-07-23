# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight(stones)
  # O(nlogn), O(1)
  heap = MaxHeap.new(stones)

  # find diff as long as there are atleast 2 elements in heap
  while heap.size > 1
    first = heap.pop
    second = heap.pop
    diff = first - second

    # only add onto heap if diff exists
    heap.push(diff) if diff != 0
  end

  # return 0 if empty heap otherwise return last element
  heap.size == 1 ? heap.max : 0
end
