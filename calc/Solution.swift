//
//  Solution.swift
//  calc
//
//  Created by David on 23/2/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

class Solution {
    var numbers : [Int] = []
    var ops : [Character] = []
    var inputs : [Any] = []
    var isOpsPrev = false
    var isNeg = 1
    var curr_num_string = ""

    init(arg: String) {
        
    }

    func normalizeOps() {
        var isExecute = false
        for input in inputs {
            if var num = input as? Int {
                if isExecute {
                    let lastOp = self.ops.popLast()!
                    let lastNum = self.numbers.popLast()!
                    if lastOp == "/" {
                        if num == 0 {
                            Ultility.exitProgram("Division by zero")
                        }
                        num = lastNum / num
                    } else if lastOp == "x" {
                        num = lastNum * num
                    } else {
                        if num == 0 {
                            Ultility.exitProgram("Division by zero")
                        }
                        num = lastNum % num
                    }
                }
                self.numbers.append(num)
            }
            else if let op = input as? Character {
                self.ops.append(op)
                isExecute = (op == "-" || op == "+") ? false : true
            }
        }
    }

    func executeOps() -> Int {
        while self.ops.count > 0 {
            let op = self.ops.removeFirst()
            let num1 = self.numbers.removeFirst()
            let num2 = self.numbers.removeFirst()
            if op == "+" {
                self.numbers.insert(num1 + num2, at: 0)
            } else {
                self.numbers.insert(num1 - num2, at: 0)
            }
        }
        return self.numbers[0]
    }

}
