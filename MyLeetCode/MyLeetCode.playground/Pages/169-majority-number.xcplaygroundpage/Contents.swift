/*
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 
 You may assume that the array is non-empty and the majority element always exist in the array.
 */
import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        if (nums.count == 1) {
            return nums[0]
        }
        
        var majority = nums[0]
        var count = 1
        
        for index in 1..<nums.count {
            if (majority == nums[index]) {
                count += 1
            } else {
                count -= 1
                if (count <= 0) {
                    majority = nums[index]
                    count = 1
                }
            }
        }
        
        return majority
    }
}

