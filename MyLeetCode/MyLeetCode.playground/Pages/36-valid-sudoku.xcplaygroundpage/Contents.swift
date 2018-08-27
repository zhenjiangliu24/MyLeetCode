/*
 Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
 
 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 
 Example 1:
 
 Input:
 [
 ["5","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 Output: true
 */
import Foundation

class Solution {
    let matrixSize: Int = 9
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var columCheck: [[Bool]] = Array(repeating: Array(repeating: false, count: matrixSize + 1), count: matrixSize)
        
        var cubeCheck: [[Bool]] = columCheck
        
        for row in 0..<matrixSize {
            var rowCheck: [Bool] = Array(repeating: false, count: matrixSize + 1)
            
            for col in 0..<matrixSize {
                guard let num = Int(String(board[row][col])) else {
                    continue
                }
                
                let cubeN = cubeNum(row: row, col: col)
                if (rowCheck[num] || columCheck[col][num] || cubeCheck[cubeN][num]) {
                    return false
                }
                rowCheck[num] = true
                columCheck[col][num] = true
                cubeCheck[cubeN][num] = true
            }
        }
        return true
    }
    
    /*
     0   1   2
     3   4   5
     6   7   8  each one is a 3*3 matrix
     */
    private func cubeNum(row: Int, col: Int) -> Int {
        return (row / 3) * 3 + col / 3
    }
}
