/*
 Given a binary tree, find its minimum depth.
 
 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given binary tree [3,9,20,null,null,15,7],
 
  3
 / \
 9  20
   /  \
  15   7
 return its minimum depth = 2.
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
    func minDepth(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        
        if root?.left == nil {
            return 1 + minDepth(root?.right)
        }
        
        if root?.right == nil {
            return 1 + minDepth(root?.left)
        }
        
        return 1 + min(minDepth(root?.left), minDepth(root?.right))
    }
}
