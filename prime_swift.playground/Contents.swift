//: Playground - noun: a place where people can play
import UIKit

// Created by Eric John Adamos (ericjohnadamos@gmail.com) on 04/01/2016.

let numberValue: Int = 10000

func getPrimeUsingSieveOfEratosthenes(n: Int) -> [Int] {
  // Skip the first element value one, since it is not a prime
  var arrayBool: [Bool] = [Bool](        count: n - 1,
                                 repeatedValue: true)
  
  for var i: Int = 2; i <= Int(sqrt(Double(n))); ++i {
    if arrayBool[i - 2] {
      for var j: Int = i + i; j <= n; j = i + j {
        if arrayBool[j - 2] {
          arrayBool[j - 2] = false
        }
      }
    }
  }
  
  // Prepare the return result
  var results: [Int] = []
  for (index, bit) in arrayBool.enumerate() {
    if bit {
      results.append(index + 2)
    }
  }
  
  return results;
}

let startTime = CFAbsoluteTimeGetCurrent()
getPrimeUsingSieveOfEratosthenes(numberValue)
print(CFAbsoluteTimeGetCurrent() - startTime)