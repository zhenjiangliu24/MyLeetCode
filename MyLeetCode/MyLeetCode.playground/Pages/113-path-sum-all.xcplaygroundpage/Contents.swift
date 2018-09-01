/*
 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given the below binary tree and sum = 22,
 
      5
     / \
    4   8
   /   / \
 11  13  4
/  \    / \
7   2  5   1
 Return:
 
 [
 [5,4,11,2],
 [5,8,4,5]
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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var paths = [[Int]]()
        var currentPath = [Int]()
        
        dfs(root, sum, paths: &paths, currentPath: &currentPath)
        
        return paths
    }
    
    private func dfs(_ root: TreeNode?, _ sum: Int, paths: inout [[Int]], currentPath: inout [Int]) {
        guard let root = root else {
            return
        }
        
        currentPath.append(root.val)
        
        if root.left == nil && root.right == nil && root.val == sum {
            paths.append(currentPath)
            return
        }
        
        var leftPath = currentPath
        var rightPath = currentPath
        
        dfs(root.left, sum - root.val, paths: &paths, currentPath: &leftPath)
        dfs(root.right, sum - root.val, paths: &paths, currentPath: &rightPath)
    }
}
