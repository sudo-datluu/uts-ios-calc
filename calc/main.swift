//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

// var args = ProcessInfo.processInfo.arguments
// args.removeFirst() // remove the name of the program
let args = ["-12--451+98- 12 / - 3"]
let parser = Parser()

for arg in args {
    let solution = Solution(arg: arg)
    solution.inputs = parser.parseArg(arg)
    print(solution.inputs)
    exit(0)
}

/*
"12 - 3 + - 45 + 1"
[12,-,3,+,-45,+,1]
*/
