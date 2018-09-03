/*
 Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.
 
 Note: The algorithm should run in linear time and in O(1) space.
 
 Example 1:
 
 Input: [3,2,3]
 Output: [3]
 Example 2:
 
 Input: [1,1,1,3,3,2,2,2]
 Output: [1,2]
 */

import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        
        var major1: Int?
        var major2: Int?
        var count1 = 0
        var count2 = 0
        
        for num in nums {
            if let major1 = major1, major1 == num {
                count1 += 1
            } else if let major2 = major2, major2 == num {
                count2 += 1
            } else if count1 == 0 {
                major1 = num
                count1 = 1
            } else if count2 == 0 {
                major2 = num
                count2 = 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }
        
        count1 = 0
        count2 = 0
        
        for num in nums {
            if num == major1 {
                count1 += 1
            } else if num == major2 {
                count2 += 1
            }
        }
        
        if count1 > nums.count / 3 {
            result.append(major1!)
        }
        
        if count2 > nums.count / 3 {
            result.append(major2!)
        }
        
        return result
    }
}
