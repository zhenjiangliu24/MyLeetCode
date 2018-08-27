/*
 Given a binary array, find the maximum number of consecutive 1s in this array.
 
 Example 1:
 Input: [1,1,0,1,1,1]
 Output: 3
 
 Explanation: The first two digits or the last three digits are consecutive 1s.
 The maximum number of consecutive 1s is 3.
 */
import Foundation

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var count = 0
        var max = 0
        for i in 0..<nums.count {
            if nums[i] == 1 {
                count += 1
                
                if count > max {
                    max = count
                }
            } else {
                count = 0
            }
        }
        
        return max
    }
}
