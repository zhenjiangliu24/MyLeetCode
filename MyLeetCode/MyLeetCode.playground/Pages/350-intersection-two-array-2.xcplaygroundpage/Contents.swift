/*
 Given two arrays, write a function to compute their intersection.
 
 Example 1:
 
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 Example 2:
 
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 Note:
 
 Each element in the result should appear as many times as it shows in both arrays.
 The result can be in any order.
 
 Follow up:
 
 What if the given array is already sorted? How would you optimize your algorithm?
  - use two pointers, each point to the start of the array, p1 & p2
  - if array1[p1] == array2[p2]  p1 += 1, p2 += 1, add array1[p1] to the result list
  - else if array1[p1] < array2[p2]  p1 += 1
  - else p2 += 1
 
 What if nums1’s size is small compared to nums2’s size? Which algorithm is better?
  - use array1 as a hashmap
 
 What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
  - use array1 as a hashmap
 */

import Foundation

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var check = [Int: Int]()
        var result = [Int]()
        
        for num in nums1 {
            if let count = check[num] {
                check[num] = count + 1
            } else {
                check[num] = 1
            }
        }
        
        for num in nums2 {
            if let count = check[num], count > 0 {
                result.append(num)
                check[num] = count - 1
            }
        }
        return result
    }
}
