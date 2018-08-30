/*
 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as:
 
 a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 Example 1:
 
 Given the following tree [3,9,20,null,null,15,7]:
 
   3
  / \
 9  20
   /  \
  15   7
 
 Return true.
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard root != nil else {
            return true
        }
        if abs(treeDepth(root?.left) - treeDepth(root?.right)) > 1 {
            return false
        }
        
        return isBalanced(root?.left) && isBalanced(root?.right)
    }
    
    private func treeDepth(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        
        return max(treeDepth(root?.left), treeDepth(root?.right)) + 1
    }
}
