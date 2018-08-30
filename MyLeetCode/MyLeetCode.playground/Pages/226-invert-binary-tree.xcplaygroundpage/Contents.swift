/*
 Invert a binary tree.
 
 Example:
 
 Input:
 
 4
 /   \
 2     7
 / \   / \
 1   3 6   9
 Output:
 
 4
 /   \
 7     2
 / \   / \
 9   6 3   1
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else {
            return nil
        }
        let temp: TreeNode? = root?.left
        root?.left = root?.right
        root?.right = temp
        
        invertTree(root?.left)
        invertTree(root?.right)
        return root
    }
}
