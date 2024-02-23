//
//  Parser.swift
//  calc
//
//  Created by David on 23/2/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

class Parser {
    var inputs : [Any] = []
    var isOpsPrev = false
    var isNeg = 1
    var tracer = 0
    var cnt = 0
    var curr_num_string = ""
    
    func parseArg(_ arg: String) -> [Any] {
        self.inputs = []
        self.isOpsPrev = false
        self.isNeg = 1
        self.curr_num_string = ""
        self.cnt = 0
        let arg = arg.replacingOccurrences(of: " ", with: "")
        for (index, character) in arg.enumerated() {
            parseChar(character, index)
        }
        self.inputs.append((Int(self.curr_num_string) ?? 0) * self.isNeg)
        return self.inputs
    }

    func parseChar(_ character: Character, _ index: Int) {
        let type = Ultility.isDigitOrOperator(character, operators: operators)
        // Handle the case where the character is an operator
        if type == 1 {
            parseOp(character, index)
        }
        // Handle the case where the character is a digit
        else if type == 2 {
            parseNum(character)
        }
        else {
            Ultility.exitProgram("Invalid character: \(character)")
        }
    }

    func parseOp (_ op: Character, _ index: Int) {
        if (self.cnt == 1 && index == 1) || (self.cnt == 2 && index > 1) {
            Ultility.exitProgram("Invalid character: \(op)")
        }
        if self.isOpsPrev {
            if op == "-" {
                self.isNeg = -1
            }
            else if op != "+" {
                Ultility.exitProgram("Invalid character: \(op)")
            }
        }
        // Previous character is not an operator
        else {
            self.inputs.append((Int(self.curr_num_string) ?? 0) * self.isNeg)
            self.curr_num_string = ""
            self.isNeg = 1
            self.inputs.append(op)
        }
        self.cnt += 1
        self.isOpsPrev = true
    }

    func parseNum (_ num: Character) {
        self.curr_num_string += String(num)
        self.isOpsPrev = false
        self.cnt = 0
    }

}
