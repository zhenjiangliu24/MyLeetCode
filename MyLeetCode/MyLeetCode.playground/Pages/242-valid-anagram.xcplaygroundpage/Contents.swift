/*
 Given two strings s and t , write a function to determine if t is an anagram of s.
 
 Example 1:
 
 Input: s = "anagram", t = "nagaram"
 Output: true
 Example 2:
 
 Input: s = "rat", t = "car"
 Output: false
 */

import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var check: [String : Int] = [:]
        
        for c in s {
            if let n = check[String(c)] {
                check[String(c)] = n + 1
            } else {
                check[String(c)] = 1
            }
        }
        
        for c in t {
            if let n = check[String(c)], n > 0 {
                check[String(c)] = n - 1
            } else {
                return false
            }
        }
        
        return true
    }
}
