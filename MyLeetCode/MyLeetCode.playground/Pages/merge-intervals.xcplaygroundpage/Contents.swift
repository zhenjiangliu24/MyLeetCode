//: [Previous](@previous)

import Foundation

class Interval {
    var start: Int
    var end: Int
    
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {
        guard intervals.count > 1 else {
            return intervals
        }
        
        var result: [Interval] = []
        
        var intervals = intervals
        intervals.sort(by: { $0.start < $1.start })
        var point: Interval = intervals.first!
        
        for i in 1..<intervals.count {
            let temp: Interval = intervals[i]
            if temp.start > point.end {
                result.append(point)
                point = temp
            } else {
                let newEnd = max(point.end, temp.end)
                point = Interval(point.start, newEnd)
            }
        }
        
        return result
    }
}

