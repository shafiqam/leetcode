# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  # O(nlogk), O(n)
  return nil if lists.empty?

  # loop till you only have one list left
  while lists.length > 1
    result = []
    (0...lists.length).step(2) do |i|
      l1 = lists[i]
      l2 = (i+1) < lists.length ? lists[i+1] : nil # avoid index overflow
      result << merge_list(l1, l2)
    end
    lists = result # update lists array with merged results
  end

  return lists[0]
end

def merge_list(l1, l2)
  dummy_node = ListNode.new
  curr_node = dummy_node
  while l1 && l2
    if l1.val <= l2.val
      curr_node.next = l1
      l1 = l1.next
    else
      curr_node.next = l2
      l2 = l2.next
    end
    curr_node = curr_node.next
  end
  curr_node.next = l1 ? l1 : l2

  dummy_node.next
end
