/******************************************************************
 Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai).
 n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0).
 Find two lines, which together with x-axis forms a container, such that the container contains the most water.
 Note: You may not slant the container and n is at least 2.
 ********************************************************************/

import Foundation

func maxArea(_ height: [Int]) -> Int {
    if (height.count == 2) {
        return getArea(height, start: 0, end: 1)
    }
    let num = height.count
    
    var start = 0
    var end = num - 1
    var currentMax = 0
    
    while(start < end) {
        let area = getArea(height, start: start, end: end)
        if (currentMax < area) {
            currentMax = area
        }
        
        if (height[start] < height[end]) {
            start += 1
        } else {
            end -= 1
        }
    }
    return currentMax
}

func getArea(_ height: [Int], start: Int, end: Int) -> Int {
    let h = min(height[end], height[start])
    
    return h * (end - start)
}

let input = [1,8,6,2,5,4,8,3,7]
let answer = maxArea(input)
