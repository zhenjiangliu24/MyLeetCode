/*
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Example 1:
 
 Input: 123
 Output: 321
 Example 2:
 
 Input: -123
 Output: -321
 Example 3:
 
 Input: 120
 Output: 21
 */

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        guard x != 0 else { return 0 }
        
        let isPositive: Bool = x > 0 ? true : false
        
        var temp = abs(x)
        
        var result = 0
        
        while temp != 0 {
            if result > Int(Int32.max) / 10 {
                return 0
            }
            result = result * 10 + temp % 10
            temp /= 10
        }
        
        if !isPositive {
            result *= -1
        }
        
        return result
    }
}
