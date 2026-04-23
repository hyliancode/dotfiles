#!/usr/bin/env swift

import Foundation

let vowels: [Character] = ["a", "e", "i", "o", "u"]
let consonants: [Character] = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
let numbers: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

func randomElement<T>(from array: [T]) -> T {
    return array.randomElement()!
}

func generateUsername() -> String {
    var username = ""
    username.append(randomElement(from: consonants))
    username.append(randomElement(from: vowels))
    username.append(randomElement(from: consonants))
    username.append(randomElement(from: consonants))
    username.append(randomElement(from: vowels))
    username.append(randomElement(from: consonants))
    username.append(randomElement(from: consonants))
    username.append(randomElement(from: vowels))
    username.append(randomElement(from: consonants))
    username.append(randomElement(from: vowels))
    return username
}

func generatePassword() -> String {
    var password = ""
    for i in 1...3 {
        password.append(randomElement(from: consonants))
        password.append(randomElement(from: vowels))
        password.append(randomElement(from: consonants))
        password.append(randomElement(from: consonants))
        password.append(randomElement(from: vowels))
        password.append(randomElement(from: consonants))
        if i < 3 {
            password.append("-")
        }
    }

    let positions = [1, 3, 4, 6, 8, 10, 11, 13, 15, 17, 18, 20]
    let pos1 = positions.randomElement()!
    var pos2 = positions.randomElement()!
    while pos2 == pos1 {
        pos2 = positions.randomElement()!
    }

    let num = randomElement(from: numbers)
    let indexNum = password.index(password.startIndex, offsetBy: pos1 - 1)
    password.replaceSubrange(indexNum...indexNum, with: String(num))

    let charIndex = password.index(password.startIndex, offsetBy: pos2 - 1)
    let char = password[charIndex].uppercased()
    password.replaceSubrange(charIndex...charIndex, with: char)

    return password
}

print(generateUsername())
print(generateUsername())
print(generateUsername())
print(generateUsername())
print(generateUsername())
print(generateUsername())
print(generatePassword())
print(generatePassword())
print(generatePassword())
print(generatePassword())
print(generatePassword())
print(generatePassword())
