# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  # O(n), O(1)
  # find breaking half
  slow, fast = head, head.next
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end
  second = slow.next # start of second half
  slow.next = nil # cut off into two separate halves

  # reverse the second half
  prev_node = nil
  curr_node = second
  while curr_node
    temp_node = curr_node.next
    curr_node.next = prev_node
    prev_node = curr_node
    curr_node = temp_node
  end
  second = prev_node # start of second half

  # merge the two lists, second will be equal or one less in size
  # so loop can be based off second
  first, second = head, prev_node
  while second
    temp1, temp2 = first.next, second.next
    first.next = second
    second.next = temp1
    first, second = temp1, temp2
  end
end
