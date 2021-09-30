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
        
        let nums = [1, 1, 2, 2, 3]
        let mySet = Set(nums).sorted()
        return Array(mySet)
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        
        var numsDict = [Int: Int]()
        for i in 0..<firstNums.count
        {
            numsDict[firstNums[i]] = 1
        }
        for i in 0..<secondNums.count
        {
            //dict["number"]! += 10
            numsDict[secondNums[i]]?+=1;
        }
        let duplicates = numsDict.filter{$0.value>1}
        return  Array(duplicates.keys)
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        let firstWordArray = Array(firstWord)
        let secondWordArray = Array(secondWord)
        var charsDict = [Character: Int] ()
        for i in 0..<firstWord.count
        {
            charsDict[firstWordArray[i]] = 1
        }
//        print (charsDict)
        for i in 0..<secondWordArray.count
        {
            charsDict[secondWordArray[i]]?+=1
        }
//        print (charsDict)
        let charArray = charsDict.filter{$0.value>1}
        return Array(charArray.keys)
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        let string2 = String(string.filter { !" \n\t\r".contains($0) })
        var counts :[Character: Int] = [:]

        for item in string2
        {
            counts[item] = (counts[item] ?? 0) + 1
        }
        
        return counts
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        let string2 =  string.filter { !" \n\t\r".contains($0) }
        var counts :[Character: Int] = [:]

        for item in string2
        {
            counts[item] = (counts[item] ?? 0) + 1
        }

        //print(counts)

        let (value, count) = counts.max(by: {$0.1 < $1.1}) ?? (" ",0)
            
        return value
    }
    
    /// O(n) time: avoid nested for loops
    func findPairs(nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
       // print(sortedNums)
        var counts :[Int: Int] = [:]
        var pairs = 0
       

        for item in sortedNums
        {
        counts[item] = (counts[item] ?? 0) + 1
            
        }
        for item in sortedNums
        {
            //print (item)
            //print( counts[item])
            
            if(0 != counts[-1*item] ?? 0)
            {
                pairs+=1;
                print(item)
                
            }
        }
        //print (counts)
        return pairs/2
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
    
        let mySet = Set(array).sorted()
        //print(mySet)
        var priorityDict = [Int: Int]()
        var reducedPriorityArray = [Int]()
        for i in 0..<mySet.count
        {
            priorityDict[mySet[i]] = i+1
            //print (" \(mySet[i])  \(i+1)")
        }
        //print (priorityDict)
        var priority = 0
        for i in 0..<array.count
        {
            priority = array[i]
            reducedPriorityArray.append(priorityDict[priority] ?? 1)
        }
        print (reducedPriorityArray)
        return reducedPriorityArray
    }
    
}
