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
      print(  word.uppercased())
    }
    
    /// Using for loop, print each char in word
    func printLetters(word: String) {
        word.forEach { char in
            
            print(char)}
        
    }
    
    /// given a word, flip its characters, and print the result
    /// e.g. football -> llabtoof
    func flipWord(word: String) {
        let reversed = String( word.reversed())
                
                print(reversed)
        
    }
    
    /// Using for-in-enumerated(), print odd-position chars in word
    func printOddCharsEnumerated(word: String) {
        var oddPosChar: String = ""
                
        for(i, char) in word.enumerated(){
            
            if(i % 2 == 0){
                
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
           print (wordStr)
        
    }
    
    /// Using loop and string.index, return true if input is a palindrome
    func isPalindrome(word: String) -> Bool {
        
        let len = word.count / 2
                for i in 0..<len
                {
                    let start = word.index(word.startIndex, offsetBy: i)
                    let end = word.index(word.endIndex, offsetBy: (i * -1) - 1)
                    if word[start] != word[end] {
                        return false
                    }
                }
                return true
    
    }
}
