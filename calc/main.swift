//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
let operators: [Character] = ["+", "-", "x", "/", "%"]

class Ultility {

    static func isDigitOrOperator(_ character: Character, operators: [Character]) -> Int {
        if operators.contains(character) return 1
        if character.isNumber return 2
        if character == " " return 3
        return 0
    }
    
    static func exitProgram(_ message: String) {
        print(message)
        exit(1)
    }
}


class Solution {
    var numbers : [Int] = []
    var ops : [Character] = []
    var inputs : [Any] = []
    var isOpsPrev = false
    var isNeg = 1
    var curr_num_string = ""

    init(arg: [String]) {
        
    }
    
    func handleArg(_ arg: String) {
        for character in arg {
            handleChar(character)
        }
    }

    func handleChar(_ character: Character) {
        let type = Ultility.isDigitOrOperator(character, operators: operators)
        if type == 3 {
            continue
        }
        // Handle the case where the character is an operator
        else if type == 1 {
            // Previous character is an operator
            if self.isOpsPrev {
                if character == "-" {
                    self.isNeg = -1
                }
                else if character != "+" {
                    Ultility.exitProgram("Invalid character: \(character)")
                }
                continue
            }
            // Previous character is not an operator
            else {
                self.inputs.append(Int(self.curr_num_string) * self.isNeg)
                self.curr_num_string = ""
                self.isNeg = 1
                self.inputs.append(character)
            }
            self.isOpsPrev = true
        }
        // Handle the case where the character is a digit
        else if type == 2 {
            self.curr_num_string += String(character)
            self.isOpsPrev = false
        }
        else {
            Ultility.exitProgram("Invalid character: \(character)")
        }
    }

}


var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

for arg in args {
    let solution = Solution(arg: args)

    exit(0)
}

/*
"12 - 3 + - 45 + 1"
[12,-,3,+,-45,+,1]
*/
