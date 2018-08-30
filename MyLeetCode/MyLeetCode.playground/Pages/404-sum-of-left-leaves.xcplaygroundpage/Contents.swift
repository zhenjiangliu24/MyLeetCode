/*
 Find the sum of all left leaves in a given binary tree.
 
 Example:
 
    3            1
   / \          / \
  9  20        2   3
    /  \      / \
   15   7    4   5
 result: 24    result: 4
 There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        
        var leftSum = 0
        if let left = root?.left {
            // only leave node count
            if left.left == nil && left.right == nil {
                leftSum += left.val
            }
        }
        
        return leftSum + sumOfLeftLeaves(root?.left) + sumOfLeftLeaves(root?.right)
    }
}
