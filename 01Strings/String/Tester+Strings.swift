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
        for letter in word {
            print(letter)
        }
    }
    
    /// given a word, flip its characters, and print the result
    /// e.g. football -> llabtoof
    func flipWord(word: String) {
        var flipped = ""
        for char in word.reversed() {
            flipped.append(char)
        }
        print(flipped)
    }
    
    /// Using for-in-enumerated(), print odd-position chars in word
    func printOddCharsEnumerated(word: String) {
        for (idx, letter) in word.enumerated() {
            if idx % 2 == 0 {
                print(letter)
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
        var pigWord = word
        let firstLetter = word[word.index(word.startIndex, offsetBy: 0)]
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        
        if vowels.contains(firstLetter) {
            pigWord += "yay"
        } else {
            let firstChar = String(pigWord.removeFirst())
            pigWord += firstChar + "ay"
        }
        print(pigWord)
    }
    
    /// Using loop and string.index, return true if input is a palindrome
    func isPalindrome(word: String) -> Bool {
        return word == String(word.reversed())
    }
}
