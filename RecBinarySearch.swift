//
//  RecBinarySearch.swift
//
//  Created by Ketia Gaelle Kaze
//  Created on 2022-04-05
//  Version 1.0
//  Copyright (c) 2022 Ketia Gaelle Kaze. All rights reserved.
//
//  The recBinarySearch program generates 250 random numbers in an array
// and allows the user to search for a number in the array.
import Foundation

func binary(userArray: [Int], userNumber: Int, lowIndex: Int, highIndex: Int) -> Int {
    // Get the middle index of the array
    let midIndex = lowIndex + ((highIndex - lowIndex) / 2)

    if lowIndex > highIndex {
        return -1
    }

    // Check if the userNumber is at the middle
    if userArray[midIndex] == userNumber {
        return midIndex

    } else if userArray[midIndex] > userNumber {
        return binary(userArray: userArray, userNumber: userNumber, lowIndex: lowIndex, highIndex: midIndex - 1)

    } else {
        return binary(userArray: userArray, userNumber: userNumber, lowIndex: midIndex + 1, highIndex: highIndex)
    }
}

// exception at runtime error
enum MyError: Error {
  case runtimeError(String)
}

// function to catch error
func catchString() throws {
  throw MyError.runtimeError("Please enter a valid number.")
}

// Declaring constants
let MAX = 999
let MIN = 0
let ARRAYSIZE = 250

// Declaring variables
var number = 0
var numberString: String
var searchNum: Int
var searchResult: Int
var randomNumberArray: [Int] = []

// Create array of random numbers
while number < ARRAYSIZE {
    let rand = Int.random(in: MIN...MAX)
    randomNumberArray.append(rand)
    number += 1
}

// Sort the array from lowest to highest number
randomNumberArray.sort()
print(randomNumberArray)
print("\n")

print("What number are you searching for in the "
    + "array (integer between 0 and 999): ", terminator: "")
numberString = readLine()!

do {
  // Convert from string to int
  let searchNum = Int(numberString) ?? -1
  if searchNum != Int(numberString) {
    try catchString()
  }

  // Ensuring the user inputs an appropriate integer
  if searchNum > MAX || searchNum < MIN {
    print("\(searchNum) must be between \(MIN) and \(MAX).\n")

  } else {
    // Call the binary function
    searchResult = binary(userArray: randomNumberArray, userNumber: searchNum,
        lowIndex: 0, highIndex: randomNumberArray.count - 1)
    if searchResult == -1 {
        print("\n\(searchNum) is not in the array.")
    } else {
        print("\n\(searchNum) is at index \(searchResult).")
    }
  }
} catch MyError.runtimeError(let errorMessage) {
  print(errorMessage)
}
