//: [Previous](@previous)

import Foundation

/*
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
 
 The same repeated number may be chosen from candidates unlimited number of times.
 
 Note:
 
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 
 Example 1:
 
 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
 [7],
 [2,2,3]
 ]
 */
import Foundation

enum Type1 {
    case first
    case last
}

enum Type2 {
    case age
    case number
}

typealias tuple = (Type1, Type2)

func test (type: tuple) {
    switch type {
    case (Type1.first, Type2.age):
        print("")
    case (Type1.last, Type2.number):
        print("")
    default:
        print("")
    }
}

/*
 Backtracking problem
 */
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results: [[Int]] = []
        var path: [Int] = []
        
        helper(candidates.sorted(by: <), target: target, path: &path, result: &results, index: 0)
        
        return results
    }
    
    fileprivate func helper(_ candidates: [Int], target: Int, path: inout [Int], result: inout [[Int]], index: Int) {
        if target == 0 {
            result.append(path)
            return
        }
        
        for i in index..<candidates.count {
            if candidates[i] > target {
                break
            }
            path.append(candidates[i])
            helper(candidates, target: target - candidates[i], path: &path, result: &result, index: i)
            path.removeLast()
        }
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        var result: [[Int]] = []
        let sort = nums.sorted(by: <)
        
        var last: Int = Int.min
        for (number,i) in sort.enumerated() {
            if number >= sort.count - 2 {
                break
            }
            if i > 0 {
                break
            }
            if last == i {
                continue
            }
            last = i
            let others = Array(sort[(number + 1)...])
            
            let target = -i
            let temp = twoSum(others, target)
            if !temp.isEmpty {
                for array in temp {
                    var level: [Int] = [i]
                    
                    level += array
                    result.append(level)
                }
            }
        }
        
        
        return result
    }
    
    private func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 1 else { return [ ] }
        
        print(nums)
        print(target)
        var check: [Int: Int] = [:]
        var result: [[Int]] = []
        for (i, num) in nums.enumerated() {
            if let _ = check[target - num] {
                let array = [num, target - num]
                if !result.contains(array) {
                    result.append(array)
                }
            } else {
                check[num] = i
            }
        }
        return result
    }
}

let t1 = Solution().threeSum([1,2,-2,-1])

let str = "rbsr"
let test2 = str.sorted()
