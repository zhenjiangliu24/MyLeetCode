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

/*
 Backtracking problem
 */
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var path: [Int] = []
        
        helper(candidates.sorted(by: <), target: target, res: &result, path: &path, index: 0)
        
        return result
    }
    
    func helper(_ candidates: [Int], target: Int, res: inout [[Int]], path: inout [Int], index: Int) {
        if (target == 0) {
            res.append(Array(path))
            return
        }
        
        for i in index..<candidates.count {
            guard candidates[i] <= target else {
                break
            }
            path.append(candidates[i])
            helper(candidates, target: target - candidates[i], res: &res, path: &path, index: i)
            path.removeLast()
        }
    }
}
