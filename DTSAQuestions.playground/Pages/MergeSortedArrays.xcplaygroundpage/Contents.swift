import Foundation

// 🧩 Problem
// Merge two *ascending-sorted* arrays of integers into one ascending-sorted array
// **without** using Swift’s built-in sorting functions.
// Keep duplicates and preserve relative order of equal elements (stable merge).
//
// Examples:
// Input: [1, 2, 4, 5, 6, 7, 9], [3, 6, 8, 9, 10, 11, 12, 12]
// Output: [1, 2, 3, 4, 5, 6, 6, 7, 8, 9, 9, 10, 11, 12, 12]
//
// Input: [1, 3, 5], [2, 4, 6]
// Output: [1, 2, 3, 4, 5, 6]
//
// Assumptions:
// - Both inputs are already sorted in non-decreasing (ascending) order.
// - The function must run in O(n + m) time where n and m are input lengths.
// - No use of `.sorted()` or similar built-ins to do the merge.

// MARK: - Solution

/// Merges two ascending-sorted arrays into a single ascending-sorted array (stable).
///
/// - Parameters:
///   - left: First array, sorted in ascending order.
///   - right: Second array, sorted in ascending order.
/// - Returns: A new array containing all elements from `left` and `right` in ascending order.
/// - Complexity: Time `O(n + m)`, Space `O(n + m)`
///
/// Notes:
/// - Stability: equal elements from `left` appear before equal elements from `right`.
func mergeSortedArrays(_ left: [Int], _ right: [Int]) -> [Int] {
    var merged: [Int] = []
    merged.reserveCapacity(left.count + right.count) // avoid repeated reallocations

    var leftIndex = 0
    var rightIndex = 0

    // Two-pointer linear merge
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] <= right[rightIndex] {
            merged.append(left[leftIndex])
            leftIndex += 1
        } else {
            merged.append(right[rightIndex])
            rightIndex += 1
        }
    }

    // Append any remaining elements (one of these will be empty)
    if leftIndex < left.count {
        merged.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        merged.append(contentsOf: right[rightIndex...])
    }

    return merged
}

// MARK: - Demo

let array1 = [1, 2, 4, 5, 6, 7, 9]
let array2 = [3, 6, 8, 9, 10, 11, 12, 12]
print(mergeSortedArrays(array1, array2)) // [1, 2, 3, 4, 5, 6, 6, 7, 8, 9, 9, 10, 11, 12, 12]

// MARK: - Quick Checks (Playground assertions)

assert(mergeSortedArrays([1,3,5], [2,4,6]) == [1,2,3,4,5,6])
assert(mergeSortedArrays([], []) == [])
assert(mergeSortedArrays([1,2], []) == [1,2])
assert(mergeSortedArrays([], [1]) == [1])
assert(mergeSortedArrays([1,1,2], [1,2,2]) == [1,1,1,2,2,2])

// MARK: - Complexity Analysis
//
// Let n = left.count, m = right.count.
// - Time: O(n + m) — each element is examined and appended once.
// - Space: O(n + m) — output holds all elements; in-place merge is not possible
//   without extra capacity in one of the input arrays.
//
// Stability:
// - Using `<=` when comparing ensures that on ties we take from `left` first,
//   preserving relative order across equal elements.
