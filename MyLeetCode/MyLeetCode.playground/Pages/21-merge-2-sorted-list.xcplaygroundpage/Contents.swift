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
    /*
     Divide and conquer
   */
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
    
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil && l2 != nil else {
            
            return l1 == nil ? l2 : l1
        }
        
        let new = ListNode(0)
        var temp: ListNode = new
        var p1 = l1, p2 = l2
        
        while p1 != nil && p2 != nil {
            if p1!.val < p2!.val {
                temp.next = p1
                p1 = p1!.next
            } else {
                temp.next = p2
                p2 = p2!.next
            }
            temp = temp.next!
        }
        
        temp.next = p1 != nil ? p1 : p2
        
        return new.next
    }
}
