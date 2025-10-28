//: [Previous](@previous)
import Foundation

// 🧩 Problem
// Write a function that takes a string and returns its reversed version,
// **without** using Swift’s built-in `reversed()` or similar functions.
// The function should handle normal, empty, and whitespace-only strings properly.

// Examples:
// Input: "Hello, playground" → Output: "dnuorgyalp ,olleH"
// Input: "" → Output: ""
// Input: "  " → Output: "  "

// Assumptions:
// - The input may contain spaces, punctuation, or Unicode characters.
// - All-whitespace strings should be returned unchanged.
// - The function must not use `.reversed()` or `.reversed()`-related APIs.

// MARK: - Solution

/// Reverses a given string without using Swift's built-in reverse methods.
/// - Parameter text: The input string to reverse.
/// - Returns: The reversed version of the input string.
/// - Complexity: Time `O(n)`, Space `O(n)`
func reverseString(_ text: String) -> String {
    guard !text.isEmpty else { return "" }

    // Preserve whitespace-only strings
    if text.allSatisfy(\.isWhitespace) {
        return text
    }

    let characters = Array(text)
    var reversedText = ""
    reversedText.reserveCapacity(characters.count) // avoid repeated allocations

    for index in stride(from: characters.count - 1, through: 0, by: -1) {
        reversedText.append(characters[index])
    }

    return reversedText
}

// MARK: - Demo

let greeting = "Hello, playground"
print(reverseString(greeting)) // "dnuorgyalp ,olleH"
print(reverseString(""))       // ""
print(reverseString("  "))     // "  "

// MARK: - Quick Checks

assert(reverseString("Hello") == "olleH")
assert(reverseString("A") == "A")
assert(reverseString("  ") == "  ")
assert(reverseString("") == "")
assert(reverseString("Swift!") == "!tfiwS")

// MARK: - Complexity Analysis
//
// Let n = number of characters in the input string.
// - Time: O(n) — each character is accessed and appended once.
// - Space: O(n) — a new string is created to hold the reversed result.
//
// This is the most efficient possible approach without in-place mutation.
// Using built-in `.reversed()` would achieve the same complexity, but is disallowed here.













//: [Next](@next)
