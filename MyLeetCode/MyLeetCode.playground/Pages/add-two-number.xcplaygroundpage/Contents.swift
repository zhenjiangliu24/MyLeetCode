//: [Previous](@previous)

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

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
    
    func canJump(_ nums: [Int]) -> Bool {
        let n = nums.count
        guard n > 0 else {
            return false
        }
        var check = [Bool?](repeating: nil, count:n)
        
        return helper(nums, 0, &check)
    }
    
    private func helper(_ nums: [Int], _ startIndex: Int, _ check: inout [Bool?]) -> Bool {
        let n = nums.count
        guard startIndex < n else {
            return false
        }
        
        if let can = check[startIndex] {
            return can
        }
        
        if startIndex == n - 1 {
            check[startIndex] = true
            return true
        }
        
        let number: Int = nums[startIndex]
        
        guard number > 0 else {
            check[startIndex] = false
            return false
        }
        
        if number + startIndex + 1 > n {
            check[startIndex] = true
            return true
        }
        
        var result = false
        
        for i in 1..<number {
            result = result || helper(nums, startIndex + i, &check)
        }
        
        check[startIndex] = result
        
        return result
    }
    
}

let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)

let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)

let result = Solution().addTwoNumbers(l1, l2)

let result2 = Solution().canJump([2,3,1,1,4])


