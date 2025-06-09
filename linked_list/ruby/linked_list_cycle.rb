# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  # O(n), O(1)
  curr_node = head
  fast_node = head
  while fast_node && fast_node.next
    curr_node = curr_node.next
    fast_node = fast_node.next.next

    # if cycle exists, below statment would eventually be true
    return true if curr_node == fast_node
  end
  false
end
