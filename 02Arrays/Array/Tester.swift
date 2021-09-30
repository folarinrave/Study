//
//  Tester.swift
//  Array
//
//  Created by Luat on 5/19/21.
//

import Foundation

class Tester {
    static let shared = Tester()
    
    func multiplyByTwo(original: [Int]) -> [Int] {
        let newArray = original.map{$0 * 2}
        return newArray
        
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        var mid = array.count/2
        if (array.count%2 != 0)
        {
            mid+=1
        }
        let secondHalf = array[mid...]
        let newArray = Array(secondHalf)
        return newArray
        
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var numberArray = [Int]()
        for index in start...end
        {
            numberArray.append(index)
            
        }
        return numberArray;
    }

    /**
        4. Create this 2-D array
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray() -> [[Int]] {
        var twoDArray = [[Int]]()
                      var k=1;
                      for _ in 0...2
                      {
                            twoDArray.append([k, k+1,k+2])
                            k+=3;
                      }
        return twoDArray
    }

    /// 5. Write a function that returns the number of pairs of elements that sums up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        
       let count = nums.count
        var num = 0
        var pairs=0
        for i in 0..<count-1
        {
            num = nums[i]
            for j in i+1..<count
            {
                if(num+nums[j]==0)
                {
                    pairs+=1
                    
                }
            }
            
        }
        return pairs
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        let characters = Array(word)
//        print(characters)
        var indexArray = [Int]()
        let numChars = characters.count
        for i in 0..<numChars
        {
            if(characters[i] == character){
                indexArray.append(i)
            }
        }
        return indexArray
    }
    
    /**
        7. Scenario: There is a conference room, and an array of `I`s and `O`s.
        `I` means a person enters the room and needs a chair.
        `O` means a person leaves the room and a chair opens up.
        Find the maximum number of chairs required to allow everyone (at any point) to have a seat
        Ex. [ I, I, O] -> 2
     */
    func minimumChairs(array: [Character]) -> Int {
        var minChairsNeeded = 0;
        var chairsNeeded = 0;
        let numChars = array.count
        for i in 0..<numChars
        {
            if(array[i] == "I")
            {
                chairsNeeded+=1
                if(chairsNeeded>minChairsNeeded)
                {
                    minChairsNeeded=chairsNeeded
                }
            }
            else
            {
                chairsNeeded-=1;
            }
        }
        return minChairsNeeded
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        let input = "welcome to day one"
        let charArray = Array(input)
        let charCount = input.count
        var startOfWord = input.startIndex
        var endOfWord = input.startIndex
        var range = startOfWord..<endOfWord
        var mySubstring = input[range]
        var string = ""
        var returnString=""
        //  print (charCount)
        //  print (charArray)
    
        for i in 0..<charCount
        {
            if(charArray[i] == " ")
            {
                endOfWord = input.index(input.startIndex, offsetBy: i)
                
                //          let start = str.index(str.startIndex, offsetBy: 7)
                //          let end = str.index(str.endIndex, offsetBy: -6)
                range = startOfWord..<endOfWord
                
                mySubstring = input[range]
                startOfWord = input.index(input.startIndex, offsetBy: i+1)
                
        string = String(mySubstring)
                returnString.append(returnPigLatin(string))
                returnString.append(" ")
                
            }
            
        }
        //append the last word
        endOfWord = input.index(input.startIndex, offsetBy: charCount)
        range = startOfWord..<endOfWord
        mySubstring = input[range]
        string = String(mySubstring)
        returnString.append(returnPigLatin(string))
       return returnString

    }
    
    func returnPigLatin(_ word: String) -> String {
        var wordStr = word;
            let wordArray = Array(wordStr.lowercased())
            
            if(wordArray[0]=="a" || wordArray[0]=="e"
                || wordArray[0]=="i"
                || wordArray[0]=="o"
                || wordArray[0]=="u"
            )
            {
                wordStr.append("yay")
            }
            else
            {
                let firstChar = word[word.startIndex]
                wordStr.removeFirst()
                wordStr.append(firstChar)
                wordStr.append("ay")
            }
            return wordStr
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5
     */
    
    
    func maxProfit(array: [Int]) -> Int {
        var maxDifference = 0;
//        var minPriceDay = 0;
//        var maxPriceDay = 0;
        let countPrices = array.count
        for i in 0..<countPrices-1
        {
            for j in i..<countPrices
            {
                if(array[j] - array[i] > maxDifference)
                {
//                    minPriceDay = i;
//                    maxPriceDay = j;
                    maxDifference = array[j] - array[i]
                    //print (maxDifference)
                }
            }
        }
        return maxDifference
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        
        let mySet = Set(array).sorted()
        //print(mySet)
        var priorityDict = [Int: Int]()
        var reducedPriorityArray = [Int]()
        for i in 0..<mySet.count
        {
            priorityDict[mySet[i]] = i+1
            //print ("\(i+1)  \(mySet2[i])")
        }
        //print (priorityDict)
        var priority = 0
        for i in 0..<array.count
        {
            priority = array[i]
            reducedPriorityArray.append(priorityDict[priority] ?? 1)
        }
        return reducedPriorityArray
    }
}
