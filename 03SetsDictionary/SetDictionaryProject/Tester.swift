//
//  Tester.swift
//  SetDictionaryProject
//
//  Created by Luat on 8/4/21.
//

import Foundation

struct Tester {
    /// Remove an array with the duplicated values removed
    func removeDups(nums: [Int]) -> [Int] {
        let output = Array(Set(nums))
        return output
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        let common = firstNums.filter { num in
            secondNums.contains(num)
        }
        return common
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var output = [Character]()
        firstWord.forEach { letter in
            if secondWord.contains(letter) {
                output.append(letter)
            }
        }
        return output
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var counterDict = [Character:Int]()
        string.forEach { char in
            if var doesExist = counterDict[char] {
                doesExist += 1
            } else {
                counterDict[char] = 1
            }
//            guard let doesExist = counterDict[char] else {
//                counterDict[char] = 1
//                return
//            }
//            if counterDict[char] {
//                counterDict[char] + 1
//            } else {
//                counterDict[char] = 1
//            }
        }
        return counterDict
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        return "."
    }
    
    /// O(n) time: avoid nested for loops
    func findPairs(nums: [Int]) -> Int {        
        return 1
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        return [1]
    }
    
}
