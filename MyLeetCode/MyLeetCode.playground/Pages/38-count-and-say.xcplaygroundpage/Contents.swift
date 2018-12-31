/*
 The count-and-say sequence is the sequence of integers with the first five terms as following:
 
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 1 is read off as "one 1" or 11.
 11 is read off as "two 1s" or 21.
 21 is read off as "one 2, then one 1" or 1211.
 
 */

import Foundation

class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        
        let last = countAndSay(n - 1)
        let lastArray = Array(last)
        
        var count = 1
        var i = 0
        var temp = ""
        var result = ""
        while i < lastArray.count {
            if temp != String(lastArray[i]) {
                result += i == 0 ? "" : String(count) + temp
                temp = String(lastArray[i])
                count = 1
            } else {
                count += 1
            }
            i += 1
        }
        
        result += String(count) + temp
        
        return result
    }
}
