/*
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
   3
  / \
 9  20
   /  \
  15   7
 return its level order traversal as:
 [
 [3],
 [9,20],
 [15,7]
 ]
 */
import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        var queue = [TreeNode]()
        
        if let root = root {
            queue.append(root)
        }
        
        while !queue.isEmpty {
            let levelSize = queue.count
            var level = [Int]()
            
            for i in 0..<levelSize {
                let node = queue[0]
                queue.remove(at: 0)
                
                level.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(level)
        }
        
        return result
    }
}
