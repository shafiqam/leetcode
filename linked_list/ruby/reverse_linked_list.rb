# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  # iterative
  # O(n), O(1)
  curr_node = head
  prev_node = nil
  while curr_node
    next_node = curr_node.next
    curr_node.next = prev_node
    prev_node = curr_node
    curr_node = next_node
  end
  prev_node

  # recursive
  # O(n), O(n)
  # return head if head.nil?

  # new_head = head
  # if head.next
  #   new_head = reverse_list(head.next)
  #   head.next.next = head
  # end

  # head.next = nil
  # new_head
end
