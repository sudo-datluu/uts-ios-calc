//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args : [String] = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

let joinedString = args.joined(separator: "")
let parser = Parser()

let solution = Solution(arg: joinedString)

// Process
solution.inputs = parser.parseArg(joinedString)
if (Ultility.isLastElementAnInteger(solution.inputs)) {
    solution.normalizeOps()
    print(solution.executeOps())
}
else {
    Ultility.exitProgram("Invalid input", false)
}

/*
- Error handle message:
    - Invalid symbol
    - Division by 0

- The div operator?
    - 12 / 5 * 6 = 12 or 14

- How to run the test module
*/
