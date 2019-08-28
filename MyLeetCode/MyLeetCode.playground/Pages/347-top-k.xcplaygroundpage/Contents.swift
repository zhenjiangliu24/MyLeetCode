//: [Previous](@previous)

import Foundation

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 1  else { return nums }
        var check: [Int: Int] = [:]
        
        for i in 0..<nums.count {
            if let number = check[nums[i]] {
                check[nums[i]] = number + 1
            } else {
                check[nums[i]] = 1
            }
        }
        let len = nums.count + 1
        var buckets: [[Int]] = [[Int]](repeating: [], count: len)
        
        for key in check.keys {
            buckets[check[key]!].append(key)
        }
        var results: [Int] = []
        for index in stride(from: nums.count, to: 0, by: -1) {
            print(index)
            if buckets[index].count > 0 && results.count < k {
                results += buckets[index]
            }
        }
        
        return results
    }
}

let s = Solution()
let result = s.topKFrequent([1,2], 2)
print(result)
