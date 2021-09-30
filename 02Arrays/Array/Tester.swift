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
        let res = original.map{ $0 * 2 }
        return res
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        guard array.count > 1 else { return array}
        if array.count == 2 {
            var res = array
            res.removeFirst()
            return res
        } else {
            
            if array.count % 2 == 0 {
                var median = (array.count/2)-1
                var res = array
                res.removeFirst(median+1)
                return res
                
            } else {
                var lastHalf = [Int]()
                var res = [Int]()
                var median = array.count/2
                
                for i in median+1..<array.count {
                    res.append(array[i])
                }
                lastHalf = res
                return lastHalf
            }
        }
        return []
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var res = [Int]()
        for i in start...end{
            res.append(i)
        }
        return res
    }

    /**
        4. Create this 2-D array
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray() -> [[Int]] {
        var res = [[Int]]()
        var counter = 1
        for i in counter...3{
            var lilArray = [Int]()
            for j in 1...3{
                
                lilArray.append(counter)
                counter += 1
            }
            res.append(lilArray)
            print(res)
        }
        return res
    }

    /// 5. Write a function that returns the number of pairs of elements that sums up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var count = 0
        for i in 0..<nums.count {
            var diff = 0-nums[i]
            if nums.contains(diff) && nums.firstIndex(of: diff)! > i {
                count += 1
            }
           
        }
        return count
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var res = [Int]()
        var index = 0
           for char in word {
               if char == character {
                   res.append(index)
               }
               index+=1
           }
           return res
    }
    
    /**
        7. Scenario: There is a conference room, and an array of `I`s and `O`s.
        `I` means a person enters the room and needs a chair.
        `O` means a person leaves the room and a chair opens up.
        Find the maximum number of chairs required to allow everyone (at any point) to have a seat
        Ex. [ I, I, O] -> 2
     */
    func minimumChairs(array: [Character]) -> Int {
        var  enter = 0
        var exit = 0
        
        for i in 0..<array.count {
            if i == 0 {
                if array[i] == "I" {
                    enter += 1
                } else {
                    exit += 1
                }
            } else {
                if array[i] == "O" {
                    exit += 1
                } else {
                    if array[i] == "I" && enter == exit {
                        exit -= 1
                    } else if array[i] == "I" && exit > enter {
                        enter += i
                    } else {
                        enter += 1
                    }
                }
            }
            print("enter: \(enter) exit: \(exit)")
        }
        return enter
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        var res = ""
        var sentenceCopy = sentence
        var words = sentenceCopy.components(separatedBy: CharacterSet.whitespaces)
        for word in words {
          var pigWord = returnPigLatin(word: word)
            res =  res + pigWord + " "
            
        }
        res = res.trimmingCharacters(in: .whitespacesAndNewlines)
        return res
    }
    
    func returnPigLatin(word: String) -> String {
        var res = ""
        let vowels: [Character] = ["a", "A", "e","E", "i", "I", "o", "O", "u", "U"]
        var wordArray = [Character]()
        for char in word {
            wordArray.append(char)
        }
        if let firstChar = wordArray.first {
            if vowels.contains(firstChar) {
                wordArray.append("y")
                wordArray.append("a")
                wordArray.append("y")
                for char in wordArray {
                    var toString = String(char)
                    res = res + toString
                }
            } else {
                wordArray.removeFirst()
                wordArray.append(firstChar)
                wordArray.append("a")
                wordArray.append("y")
                for char in wordArray {
                    var toString = String(char)
                    res = res + toString
                }
                
            }
        }
        res = res.trimmingCharacters(in: .whitespacesAndNewlines)
        return res
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5
     */
    
    
    func maxProfit(array: [Int]) -> Int {
        var res = 0
        var arrayCopy = array
        arrayCopy.dropLast()
        if let min = arrayCopy.min(){
            arrayCopy = array
            var buyIndex = arrayCopy.firstIndex(of: min)
            for i in 0..<buyIndex! {
                arrayCopy.remove(at: i)
            }
            if let max = arrayCopy.max() {
                res = max-min
            }
            
        }
        return res
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
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
