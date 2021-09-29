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
        
        var res = Array(nums)
        return res
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        
        var numsDict = [Int:Int]()
        for i in 0..<firstNums.count {
            if numsDict[firstNums[i]] == nil {
                numsDict[firstNums[i]] = 1
            } else {
                numsDict[firstNums[i]]! += 1
            }
        }
        
        for j in 0..<secondNums.count {
            if numsDict[secondNums[j]] == nil {
                numsDict[secondNums[j]] = 1
            } else {
                numsDict[secondNums[j]]! += 1
            }
        }
        
        var res = [Int]()
        for (key, value) in numsDict {
            if value >= 2 {
                res.append(key)
            }
        }
        
        
        return res
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
       
            let firstWordSet = Set(firstWord)
            let secondWordSet = Set(secondWord)
            var samesies = firstWordSet.intersection(secondWordSet)
            let res = Array(samesies)
            return res
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var charDict = [Character:Int]()
        var stringCopy = string
        let trimmed = String(stringCopy.filter{!" \n\t\r".contains($0) })
        for char in trimmed {
            if charDict[char] == nil {
                charDict[char] = 1
            } else {
                charDict[char]! += 1
            }
            
        }
        
        return charDict
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        let trimmed = String(string.filter{!" \n\t\r".contains($0)})
        var charDict = [Character:Int]()
        for char in trimmed {
            if charDict[char] == nil {
                charDict[char] = 1
            } else {
                charDict[char]! += 1
            }
            
        }
        
        var max = charDict.max { a,b in a.value < b.value}
        
        return max!.key
    }
    
    /// O(n) time: avoid nested for loops
    func findPairs(nums: [Int]) -> Int {        
        var count = 0
        for i in 0..<nums.count {
            var diff = 0-nums[i]
            if nums.contains(diff){
                if nums.firstIndex(of: diff)! > i {
                    count += 1
                }
                
            }
        }
        return count
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        var orderDict = [Int:Int]()
        let singles = Set(array)
        var singlesArray = Array(singles)
        print(singlesArray)
        singlesArray.sort()
        
        for i in 0..<array.count {
            if orderDict[array[i]] == nil {
               
                orderDict[array[i]] = singlesArray.firstIndex(of: array[i])
            }
        }
        let baseOne = orderDict.compactMapValues{ $0 + 1}
        
       
        var res = [Int]()
        for i in 0..<array.count {
            if baseOne[array[i]] != nil {
                res.append(baseOne[array[i]]!)
            }
        }
        return res
    }
    
}
