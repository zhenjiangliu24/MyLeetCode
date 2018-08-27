/*
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 Note: Given n will be a positive integer.
 
 Example 1:
 
 Input: 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 
 */
import Foundation

class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else {
            return n
        }
        var first: Int = 1
        var second: Int = 2
        
        var num = 3
        
        while num <= n {
            var temp = first
            first = second
            second = first + temp
            num += 1
        }
        
        return second
    }
}
