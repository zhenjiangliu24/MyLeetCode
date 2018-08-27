/*
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 If the target is not found in the array, return [-1, -1].
 
 Example 1:
 
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 
 Example 2:
 
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 */

import Foundation

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [ -1, -1]
        let right = searchRightPosition(nums, start: 0, end: nums.count - 1, target: target)
        
        guard right > 0 && nums[right] == target else {
            return result
        }
        
        result[0] = searchLeftPosition(nums, start: 0, end: right, target: target)
        result[1] = right
        return result
    }
    
    private func searchRightPosition(_ nums: [Int], start: Int, end: Int, target: Int) -> Int {
        var left = start
        var right = end
        while left <= right {
            let mid = (left + right) >> 1
            if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return right
    }
    
    private func searchLeftPosition(_ nums: [Int], start: Int, end: Int, target: Int) -> Int {
        var left = start
        var right = end
        while left <= right {
            let mid = (left + right) >> 1
            if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
