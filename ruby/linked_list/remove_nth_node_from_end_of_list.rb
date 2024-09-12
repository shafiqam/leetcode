# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  # O(n), O(1)
  dummy_node = ListNode.new(0, head)
  prev_to_nth_node = dummy_node
  curr_node = head

  # iterate nth_curr_node to find the nth from beginning
  while n > 0 && curr_node
    curr_node = curr_node.next
    n -= 1
  end

  # iterate both curr_node, nth_node to find the nth from end
  while curr_node
    curr_node = curr_node.next
    prev_to_nth_node = prev_to_nth_node.next
  end

  # here update the next pointers to remove the nth node
  prev_to_nth_node.next = prev_to_nth_node.next.next

  dummy_node.next # head of new list
end
