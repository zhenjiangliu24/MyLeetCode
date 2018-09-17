/*
 
 Given an integer, write a function to determine if it is a power of two.
 
 Example 1:
 
 Input: 1
 Output: true
 Explanation: 20 = 1
 Example 2:
 
 Input: 16
 Output: true
 Explanation: 24 = 16
 Example 3:
 
 Input: 218
 Output: false
 */

/*
 func isPowerOfTwo(n: Int) -> Bool {
 guard n > 0 else {
 return false
 }
 
 return n & (n - 1) == 0
 }
 */

import Foundation

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        if n < 3 {
            return true
        }
        guard n % 2 == 0 else { return false }
        var num = n
        while num % 2 == 0  {
            num = num >> 1
        }
        
        return num == 1 ? true : false
    }
}
