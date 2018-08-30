/*
 Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
 
 Example:
 Given a binary tree
    1
   / \
  2   3
 / \
4   5
 Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].
 
 Note: The length of path between two nodes is represented by the number of edges between them.
 
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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        
        let diameter = treeDepth(root?.left) + treeDepth(root?.right)
        
        return max(diameter, max(diameterOfBinaryTree(root?.left), diameterOfBinaryTree(root?.right)))
    }
    
    private func treeDepth(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        
        return max(treeDepth(root?.left), treeDepth(root?.right)) + 1
    }
}
