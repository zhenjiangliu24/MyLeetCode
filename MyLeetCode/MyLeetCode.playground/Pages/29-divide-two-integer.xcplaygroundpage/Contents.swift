/*
Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.

Return the quotient after dividing dividend by divisor.

The integer division should truncate toward zero.
 
 Input: dividend = 10, divisor = 3
 Output: 3
 
 */
import Foundation

class Solution {
    static let MAX_VALUE = 2147483647
    static let MIN_VALUE = -2147483648
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        guard divisor != 0 else {
            return dividend > 0 ? Solution.MAX_VALUE : Solution.MAX_VALUE
        }
        
        guard dividend != 0 else {
            return 0
        }
        
        if (dividend == Solution.MAX_VALUE && divisor == -1) {
            return Solution.MIN_VALUE
        }
        
        if (dividend == Solution.MIN_VALUE && divisor == -1) {
            return Solution.MAX_VALUE
        }
        
        let isNegative = (dividend > 0 && divisor < 0) || (dividend < 0 && divisor > 0)
        
        var a = dividend > 0 ? dividend : -dividend
        let b = divisor > 0 ? divisor : -divisor
        var result = 0
        
        while a >= b {
            var shift: Int = 0
            while a >= (b << shift) {
                shift += 1
            }
            result += 1 << (shift - 1)
            a -= b << (shift - 1)
        }
        return isNegative ? -result: result
    }
}
