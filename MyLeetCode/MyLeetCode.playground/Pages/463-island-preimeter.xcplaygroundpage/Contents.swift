/*
 You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
 
 Example:
 
 [[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]
 
 Answer: 16
 Explanation: The perimeter is the 16 yellow stripes in the image below:
 
 */
import Foundation

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var cells = 0
        var commonEdge = 0
        
        let rows = grid.count
        let cols = grid[0].count
        
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 1 {
                    cells += 1
                    
                    if row < rows - 1 && grid[row + 1][col] == 1 {
                        commonEdge += 1
                    }
                    if col < cols - 1 && grid[row][col + 1] == 1 {
                        commonEdge += 1
                    }
                }
            }
        }
        return cells * 4 - commonEdge * 2
    }
}


