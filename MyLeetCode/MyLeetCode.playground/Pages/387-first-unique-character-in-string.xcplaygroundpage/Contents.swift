/*
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
 
 Examples:
 
 s = "leetcode"
 return 0.
 
 s = "loveleetcode",
 return 2.
 Note: You may assume the string contain only lowercase letters.
 */
import Foundation

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        guard s != "" else {
            return -1
        }
        var check = [String: Int]()
        var index = 0
        for c in s.characters {
            if let num = check[String(c)] {
                check[String(c)] = -1
            } else {
                check[String(c)] = index
            }
            index += 1
        }
        
        var minIndex = Int.max
        for key in check.keys {
            if let i = check[key], i >= 0 {
                minIndex = min(minIndex, i)
            }
        }
        return minIndex != Int.max ? minIndex : -1
    }
}
