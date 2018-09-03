/*
 Given two arrays, write a function to compute their intersection.
 
 Example 1:
 
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2]
 Example 2:
 
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [9,4]
 Note:
 
 Each element in the result must be unique.
 The result can be in any order.
 */

import Foundation

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var check = [Int: Bool]()
        var result = [Int]()
        
        for num in nums1 {
            check[num] = true
        }
        
        for num in nums2 {
            if let inNum1 = check[num], inNum1 {
                result.append(num)
                check[num] = false
            }
        }
        return result
    }
}
