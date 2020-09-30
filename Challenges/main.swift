//
//  main.swift
//  Challenges
//
//  Created by Anna Shmatlai on 10/08/2020.
//  Copyright © 2020 Anna Shmatlai. All rights reserved.
//

import Foundation

//print("Hello, World!")

//MARK:- Challenge 1: Are the letters unique?

func challenge1(input: String) -> Bool {
    return Set(input).count == input.count
}

assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")


//MARK:- Challenge 2: Is a string a palindrome?

func challenge2(input: String) -> Bool {
    let onlyLowercasedLetters = onlyLettersString(input.lowercased())
    return String(onlyLowercasedLetters.reversed()) == onlyLowercasedLetters
}

func onlyLettersString(_ line: String) -> String {
    let lines = line.components(separatedBy: CharacterSet.alphanumerics.inverted).filter { !$0.isEmpty }
    return lines.joined()
}

assert(challenge2(input: "rotator") == true, "Challenge 2 failed")
assert(challenge2(input: "Rats live on no evil star") == true, "Challenge 2 failed")
assert(challenge2(input: "Never odd or even") == true, "Challenge 2 failed")
assert(challenge2(input: "Hello, world") == false, "Challenge 2 failed")

//MARK:- Challenge 3: Do two strings contain the same characters?

func challenge3(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

assert(challenge3(string1: "abca", string2: "abca") == true, "Challenge 3 failed")
assert(challenge3(string1: "abc", string2: "cba") == true, "Challenge 3 failed")
assert(challenge3(string1: "a1 b2", string2: "b1 a2") == true, "Challenge 3 failed")
assert(challenge3(string1: "abc", string2: "abca") == false, "Challenge 3 failed")
assert(challenge3(string1: "abc", string2: "Abc") == false, "Challenge 3 failed")
assert(challenge3(string1: "abc", string2: "cbAa") == false, "Challenge 3 failed")
assert(challenge3(string1: "abcc", string2: "abca") == false, "Challenge 3 failed")

// MARK:- Does one string contain another?

extension String {
    func fuzzyContains(_ string: String) -> Bool {
        return (range(of: string, options: .caseInsensitive) != nil)
    }
}

assert("Hello, world".fuzzyContains("Hello") == true, "Challenge 4 failed")
assert("Hello, world".fuzzyContains("WORLD") == true, "Challenge 4 failed")
assert("Hello, world".fuzzyContains("Goodbye") == false, "Challenge 4 failed")


// MARK:- Challenge 5: Count the characters

func challenge5(input: String, count: Character) -> Int {
    let modified = input.replacingOccurrences(of: String(count), with: "")
    return input.count - modified.count
}

assert(challenge5(input: "The rain in Spain", count: "a") == 2, "Challenge 5 failed")
assert(challenge5(input: "Mississippi", count: "i") == 4, "Challenge 5 failed")
assert(challenge5(input: "Hacking with Swift", count: "i") == 3, "Challenge 5 failed")

// MARK:- Challenge 6: Remove duplicate letters from a string

func challenge6(string: String) -> String {
    var used = [Character: Bool]()
    let result = string.filter({
        used.updateValue(true, forKey: $0) == nil
    })
    
    
    return String(result)
}

assert(challenge6(string: "wombat") == "wombat", "Challenge 6 failed")
assert(challenge6(string: "hello") == "helo", "Challenge 6 failed")
assert(challenge6(string: "Mississippi") == "Misp", "Challenge 6 failed")

// MARK:- Challenge 7: Condense whitespace

func challenge7(input: String) -> String {
    return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}

assert(challenge7(input: "a   b   c") == "a b c", "Challenge 7 failed")
assert(challenge7(input: "    a") == " a", "Challenge 7 failed")
assert(challenge7(input: "abc") == "abc", "Challenge 7 failed")

// MARK:- Challenge 8: String is rotated

func challenge8(_ string1: String, _ string2: String) -> Bool {
    guard string1.count == string2.count else { return false }
    let s3 = string1 + string1
    return s3.contains(string2)
}

assert(challenge8("abcde", "eabcd") == true, "Challenge 8 failed")
assert(challenge8("abcde", "cdeab") == true, "Challenge 8 failed")
assert(challenge8("abcde", "abced") == false, "Challenge 8 failed")
assert(challenge8("abc", "a") == false, "Challenge 8 failed")

// MARK: - Challenge 9: Find pangrams

func challenge9(_ string: String) -> Bool {
    let str = string.lowercased().filter({ $0.isLetter})
    return Set(str).count == 26
}

assert(challenge9("The quick brown fox jumps over the lazy dog") == true, "Challenge 9 failed")
assert(challenge9("The quick brown fox jumped over the lazy dog") == false, "Challenge 9 failed")

// MARK:- Challenge 10: Vowels and consonants

func challenge10(_ string: String) -> (Int, Int) {
    let vowels = "aoiue"
    var vowelsCount = 0
    var cononantsCount = 0
    let str = string.lowercased().filter({$0.isLetter})
    for char in str {
        if vowels.contains(char) {
            vowelsCount += 1
        } else {
            cononantsCount += 1
        }
    }
    return (vowelsCount, cononantsCount)
//    let vowelsStringCount = string.lowercased().filter({ vowels.contains(String($0))})
//    let otherString = string.lowercased().filter({ $0.isLetter })
//    return (vowelsStringCount.count, otherString.count-vowelsStringCount.count)
}

assert(challenge10("Swift Coding Challenges") == (6, 15), "Challenge 10 failed")
assert(challenge10("Mississippi") == (4, 7), "Challenge 10 failed")

// MARK:- Challenge 11: Three different letters

func challenge11(first: String, second: String) -> Bool {
    guard first.count == second.count else {
        return false
    }
    let firstArr = Array(first)
    let secondArr = Array(second)
    var count = 0
    
    for (i, char) in firstArr.enumerated() {
        if String(char) != String(secondArr[i]) {
            count += 1
            if count > 3 {
                return false
            }
        }
    }
    return true
}

assert(challenge11(first: "Clamp", second: "Cramp") == true, "Challenge 11 failed")
assert(challenge11(first: "Clamp", second: "Crams") == true, "Challenge 11 failed")
assert(challenge11(first: "Clamp", second: "Grams") == true, "Challenge 11 failed")
assert(challenge11(first: "Clamp", second: "Grans") == false, "Challenge 11 failed")
assert(challenge11(first: "Clamp", second: "Clam") == false, "Challenge 11 failed")
assert(challenge11(first: "clamp", second: "maple") == false, "Challenge 11 failed")

// MARK:- Challenge 12: Find longest prefix

func challenge12(input: String) -> String {
//    let arr = input.components(separatedBy: " ")
    let result = ""

    return result
}
