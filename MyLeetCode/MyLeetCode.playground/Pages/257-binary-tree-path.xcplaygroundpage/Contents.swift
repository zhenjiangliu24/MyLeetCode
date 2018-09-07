/*
 Given a binary tree, return all root-to-leaf paths.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Input:
 
    1
  /   \
 2     3
  \
   5
 
 Output: ["1->2->5", "1->3"]
 
 Explanation: All root-to-leaf paths are: 1->2->5, 1->3
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard root != nil else {
            return []
        }
        
        var result = [String]()
        dfs(root, current: "", output: &result)
        
        return result
    }
    
    private func dfs(_ root: TreeNode?, current: String, outp[ut: inout [String]) {
        if root?.left == nil && root?.right == nil {
            output.append("\(current)\(root!.val)")
        }
        
        if let left = root?.left {
            dfs(left, current: "\(current)\(root!.val)->", output: &output)
        }
        if let right = root?.right {
            dfs(right, current: "\(current)\(root!.val)->", output: &output)
        }
    }
}
