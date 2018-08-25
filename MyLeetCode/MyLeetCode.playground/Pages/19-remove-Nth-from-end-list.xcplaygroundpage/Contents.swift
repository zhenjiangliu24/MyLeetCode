import Foundation

/*
 Given a linked list, remove the n-th node from the end of list and return its head.
 
 Given linked list: 1->2->3->4->5, and n = 2.
 
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 */

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let pre = ListNode(0)
        pre.next = head
        
        var fast: ListNode? = pre
        var slow: ListNode? = pre
        
        for _ in 0..<n {
            fast = fast?.next
        }
        
        while (fast?.next != nil) {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        
        return pre.next
        
    }
}

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

let answer = Solution().removeNthFromEnd(node1, 2)
