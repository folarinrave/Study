//
//  Tester+Strings.swift
//  String
//
//  Created by Luat on 8/2/21.
//

import Foundation

extension Tester {

    /// Using print command
    func printWord(word: String) {
        print(word)
        
    }
    
    /// input "hello" should print "HELLO"
    func printUpperCase(word: String) {
        print(word.uppercased())
        
    }
    
    /// Using for loop, print each char in word
    func printLetters(word: String) {
        for char in word {
            print(char)
        }
        
    }
    
    /// given a word, flip its characters, and print the result
    /// e.g. football -> llabtoof
    func flipWord(word: String) {
        var rev = word.reversed()
        let res = String(rev)
        print(res)
        
        
    }
    
    /// Using for-in-enumerated(), print odd-position chars in word
    func printOddCharsEnumerated(word: String) {
        for (index, char) in word.enumerated() {
         //print("index = \(index) char = \(char)")
             var baseOne = index + 1
            //print(baseOne)
            //print
            if baseOne%2 != 0 {
                print(char)
            }
        }
        
    }
    
    /**
     Pig Latin:
     1) Move the first letter to the end and add "ay"
     pig -> igpay
     latin -> atinay
     2) IF word starts with a vowel, add "yay" to the word
     one -> oneyay
     */
    func printPigLatin(word: String) {
        let vowels: [Character] = ["a", "A", "e","E", "i", "I", "o", "O", "u", "U"]
        var wordCopy = word
        if let firstChar  = wordCopy.first {
            if vowels.contains(firstChar){
                
                wordCopy = wordCopy + "yay"
                
            } else {
                wordCopy.removeFirst()
                wordCopy.append(firstChar)
                wordCopy = wordCopy + "ay"
            }
        }
        printWord(word: wordCopy)
        
    }
    
    /// Using loop and string.index, return true if input is a palindrome
    func isPalindrome(word: String) -> Bool {
        var rev = word.reversed()
        let revString = String(rev)
        if revString == word {
            return true
        }
        return false
    }
}
