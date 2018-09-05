/*
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 Example:
 
 Input: [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Note:
 
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 */

import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 0 else {
            return
        }
        
        var p = 0
        var index = 0
        
        while index < nums.count {
            if nums[index] != 0 {
                nums[p] = nums[index]
                p += 1
            }
            index += 1
        }
        
        while p < nums.count {
            nums[p] = 0
            p += 1
        }
        
    }
}
