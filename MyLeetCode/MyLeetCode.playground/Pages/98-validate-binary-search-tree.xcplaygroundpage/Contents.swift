//: [Previous](@previous)

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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root, nil, nil)
    }
    
    
    /// helper
    ///
    /// - Parameters:
    ///   - root: root tree node
    ///   - min: the min value of the root node's value
    ///   - max: the max value of the root node's value
    /// - Returns: is valid binary search tree or not
    private func helper(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let root = root else { return true }
        
        if let min = min, min >= root.val {
            return false
        }
        
        if let max = max, max <= root.val {
            return false
        }
        
        return helper(root.left, min, root.val) && helper(root.right, root.val, max)
    }
}

