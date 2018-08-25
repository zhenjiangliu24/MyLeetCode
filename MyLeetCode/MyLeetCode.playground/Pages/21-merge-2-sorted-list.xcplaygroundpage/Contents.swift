import Foundation

/*
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if (l1 == nil || l2 == nil) {
            return l1 ?? l2
        }
        
        var newNode: ListNode?
        if (l1!.val < l2!.val) {
            newNode = l1
            newNode!.next = mergeTwoLists(l1!.next, l2!)
        } else {
            newNode = l2
            newNode!.next = mergeTwoLists(l1!, l2!.next)
        }
        
        return newNode
    }
}
