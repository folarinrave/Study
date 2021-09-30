//
//  Tester.swift
//  Array
//
//  Created by Luat on 5/19/21.
//

import Foundation

class Tester {
    static let shared = Tester()
    
    /// 1. Write a function that takes an array of numbers and returns an array with each of the numbers multiplied by 2
    func multiplyByTwo(numbers original: [Int]) -> [Int] {
        return original.map({ $0 * 2 })
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        let mid = array.count / 2
        var lastHalf = array[mid...]
        lastHalf.removeFirst()
        return Array(lastHalf)
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var startingNum = start
        var output = [Int]()
        while startingNum <= end {
            output.append(startingNum)
            startingNum += 1
        }
        return output
    }

    /**
        4. Create this 2-D array
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray() -> [[Int]] {
        [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
    }

    /// 5. Write a function that returns the number of pairs of elements that sums up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var count = Int()
        for (idx, firstPair) in nums.enumerated() {
            for secondPair in nums[idx + 1 ..< nums.count] {
                if firstPair + secondPair == 0 {
                    count += 1
                }
            }
        }
        return count
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var output = [Int]()
        for (idx, char) in word.enumerated() {
            if char == character {
                output.append(idx)
            }
        }
        return output
    }
    
    /**
        7. Scenario: There is a conference room, and an array of `I`s and `O`s.
        `I` means a person enters the room and needs a chair.
        `O` means a person leaves the room and a chair opens up.
        Find the maximum number of chairs required to allow everyone (at any point) to have a seat
        Ex. [ I, I, O] -> 2
     */
    func minimumChairs(array: [Character]) -> Int {
        var output = Int()
        var arrayOfOpenChairs = [Character]()
        array.forEach { char in
            if checkSeating(person: char)  == "X" {
                if let takeOpenSeat = arrayOfOpenChairs.firstIndex(of: "O") {
                    arrayOfOpenChairs[takeOpenSeat] = "X"
                } else {
                    arrayOfOpenChairs.append("X")
                }
            } else {
                if let leaveOpenSeat = arrayOfOpenChairs.firstIndex(of: "X") {
                    arrayOfOpenChairs[leaveOpenSeat] = "O"
                }
            }
        }
        
        
        func checkSeating(person: Character) -> Character {
            var output: Character = "P"
            if person == "I" {
                output = "X" // entered conference and needs a seat
            } else {
                output = "O" // leaving conference, open seat
            }
            return output
        }
        
        output = arrayOfOpenChairs.count
        return output
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        var output = String()
        let inputSentence = sentence.split(separator: " ")
        for (idx, word) in inputSentence.enumerated() {
            output += String(returnPigLatin(word: String(word)))
            if idx < inputSentence.count - 1 {
                output += " "
            }
        }
        return output
    }
    
    func returnPigLatin(word: String) -> String {
        var newWord = String()
        let vowels = ["a", "e", "i", "o", "u"]
        let firstLetter = String(word[word.startIndex])
        if vowels.contains(firstLetter.lowercased()) {
            newWord = word + "yay"
        } else {
            let startIdx = word.index(word.startIndex, offsetBy: 1)
            let lastIdx = word.index(word.startIndex, offsetBy: word.count - 1)
            newWord = String(word[startIdx...lastIdx])
            newWord.append(firstLetter)
            newWord += "ay"
        }
        return newWord
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5
     */
    
    
    func maxProfit(array: [Int]) -> Int {
        var output = Int()
        if let buyPrice = array.min() {
            guard var idxOfBuyPrice = array.firstIndex(of: buyPrice) else { return -1 }
            idxOfBuyPrice += 1
            let arrAfterBuyPrice = array[idxOfBuyPrice...]
            if let sellPrice = arrAfterBuyPrice.max() {
                output = sellPrice - buyPrice
            }
        }
        return output
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        var output = [Int]()
        let arraySet = Set(array).sorted()
        var priorityDict = [Int: Int]()
        for num in arraySet {
            if let idx = arraySet.firstIndex(of: num) {
                priorityDict[num] = idx + 1
            }
        }
        array.forEach { num in
            if let priNum = priorityDict[num] {
                output.append(priNum)
            }
        }
        return output
    }
}
