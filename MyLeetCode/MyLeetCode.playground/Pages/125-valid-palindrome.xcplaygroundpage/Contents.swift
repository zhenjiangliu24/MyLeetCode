/*
 iven a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 Note: For the purpose of this problem, we define empty string as valid palindrome.
 
 Example 1:
 
 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:
 
 Input: "race a car"
 Output: false
 */

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let characters = s.lowercased().characters
        
        let cleaned = characters.filter {
            return $0.description.rangeOfCharacter(from: CharacterSet.alphanumerics) != nil
        }
        
        let num = cleaned.count
        for i in 0 ..< num/2 {
            if cleaned.index(cleaned.startIndex, offsetBy: i) != cleaned.index(cleaned.startIndex, offsetBy: num - 1 - i) {
                return false
            }
        }
        return true
    }
}
