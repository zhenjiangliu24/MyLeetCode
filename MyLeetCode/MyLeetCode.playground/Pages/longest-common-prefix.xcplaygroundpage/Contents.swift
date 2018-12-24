//: [Previous](@previous)

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let first = strs.first else { return "" }
        
        var longest:[Character] = []
        var index = 0
        
        let firstCharArray = Array(first)
        let charArraies = strs.map { Array($0) }
        
        while index < firstCharArray.count {
            longest.append(firstCharArray[index])
            
            for str in charArraies {
                if str.count < index {
                    return String(longest.dropLast())
                }
                
                if str[index] != firstCharArray[index] {
                    return String(longest.dropLast())
                }
            }
            index += 1
        }
        
        return String(longest)
    }
}
