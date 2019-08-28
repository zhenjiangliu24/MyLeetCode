//: [Previous](@previous)

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //return helper(l1, l2)
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        
        var node = ListNode(1)
        var point: ListNode? = node
        var t1 = l1
        var t2 = l2
        var carry = 0
        
        while t1 != nil && t2 != nil {
            let sum = t1!.val + t2!.val + carry
            point?.next = ListNode(sum % 10)
            point = point?.next
            carry = sum / 10
            t1 = t1!.next
            t2 = t2!.next
        }
        
        while t1 != nil {
            let sum = t1!.val + carry
            point?.next = ListNode(sum % 10)
            point = point?.next
            carry = sum / 10
            t1 = t1!.next
        }
        
        while t2 != nil {
            let sum = t2!.val + carry
            point?.next = ListNode(sum % 10)
            point = point?.next
            carry = sum / 10
            t2 = t2!.next
        }
        
        if carry > 0 {
            point?.next = ListNode(carry)
        }
        
        return node.next
    }
    
    func helper(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return l1 == nil ? l2 : l1
        }
        
        let sum = l1!.val + l2!.val
        var result = ListNode(sum % 10)
        result.next = helper(l1!.next, l2!.next)
        
        if sum > 9 {
            result.next = helper(result.next, ListNode(sum / 10))
        }
        
        return result
    }
}
