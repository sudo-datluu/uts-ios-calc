//
//  Utility.swift
//  calc
//
//  Created by David on 23/2/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation
let operators: [Character] = ["+", "-", "x", "/", "%"]

class Ultility {

    static func isDigitOrOperator(_ character: Character, operators: [Character]) -> Int {
        if operators.contains(character) {return 1}
        if character.isNumber {return 2}
        return 0
    }
    
    static func exitProgram(_ message: String) {
        print(message)
        exit(1)
    }
}
