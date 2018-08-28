/*
 Given n points in the plane that are all pairwise distinct, a "boomerang" is a tuple of points (i, j, k) such that the distance between i and j equals the distance between i and k (the order of the tuple matters).
 
 Find the number of boomerangs. You may assume that n will be at most 500 and coordinates of points are all in the range [-10000, 10000] (inclusive).
 
 Input:
 [[0,0],[1,0],[2,0]]
 
 Output:
 2
 
 Explanation:
 The two boomerangs are [[1,0],[0,0],[2,0]] and [[1,0],[2,0],[0,0]]
 */
import Foundation

class Solution {
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        guard points.count > 0 else {
            return 0
        }
        
        var result = 0
        
        for point in points {
            var check = [Int : Int]()
            
            for another in points {
                guard point != another else {
                    continue
                }
                
                let distance = distanceBetween(first: point, second: another)
                if let number = check[distance] {
                    check[distance] = number + 1
                } else {
                    check[distance] = 1
                }
            }
            
            for key in check.keys {
                result += check[key]! * (check[key]! - 1)
            }
        }
        return result
    }
    
    private func distanceBetween(first point1: [Int], second point2: [Int]) -> Int {
        return (point1[0] - point2[0]) * (point1[0] - point2[0]) + (point1[1] - point2[1]) * (point1[1] - point2[1])
    }
}
