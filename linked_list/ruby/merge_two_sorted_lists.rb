# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  # O(m+n), O(m+n)
  dummy_node = ListNode.new
  curr_node = dummy_node
  while list1 && list2
    if list1.val <= list2.val
      curr_node.next = list1
      list1 = list1.next
    else
      curr_node.next = list2
      list2 = list2.next
    end
    curr_node = curr_node.next
  end

  # append to current_node if any one list has more values
  curr_node.next = list1 ? list1 : list2

  dummy_node.next # head of new list
end
