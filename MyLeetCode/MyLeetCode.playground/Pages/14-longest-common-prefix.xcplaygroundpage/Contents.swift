/*
 
 Write a function to find the longest common prefix string amongst an array of strings.
 
 If there is no common prefix, return an empty string "".
 
 Example 1:
 
 Input: ["flower","flow","flight"]
 Output: "fl"
 */

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let firstString = strs.first else { return "" }
        
        var longest: [Character] = []
        
        let firstStringArray = Array(firstString)
        let others = strs.dropFirst().map { Array($0) }
        
        for i in 0..<firstStringArray.count {
            longest.append(firstStringArray[i])
            
            for arr in others {
                if arr.count <= i {
                    return String(longest.dropLast())
                }
                
                if arr[i] != firstStringArray[i] {
                    return String(longest.dropLast())
                }
            }
        }
        
        return String(longest)
    }
}
