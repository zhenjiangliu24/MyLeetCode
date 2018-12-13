/*
 
 You are given an n x n 2D matrix representing an image.
 
 Rotate the image by 90 degrees (clockwise).
 
 Note:
 
 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
 
 Example 1:
 
 Given input matrix =
 [
 [1,2,3],
 [4,5,6],
 [7,8,9]
 ],
 
 rotate the input matrix in-place such that it becomes:
 [
 [7,4,1],
 [8,5,2],
 [9,6,3]
 ]
 */

import Foundation

class Solution {
    struct Point {
        let row: Int
        let col: Int
    }
    func rotate(_ matrix: inout [[Int]]) {
        guard matrix.count > 0 else { return }
        
        let width = matrix.count
        for i in 0..<width - 1 {
            for j in 0..<width - i {
                swap(&matrix, Point(row: i, col: j), Point(row: width - j - 1, col: width - i - 1))
            }
        }
        
        for i in 0..<width/2 {
            for j in 0..<width {
                swap(&matrix, Point(row: i, col: j), Point(row: width - i - 1, col: j))
            }
        }
    }
    
    private func swap(_ matrix: inout [[Int]], _ left: Point, _ right: Point) {
        let temp = matrix[left.row][left.col]
        matrix[left.row][left.col] = matrix[right.row][right.col]
        matrix[right.row][right.col] = temp
    }
}
