//
//  Guess.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI

struct Guess {
    let index: Int
//    var num: [Int] = [0, 0, 0, 0]
    var num = "    "
    var numArr: [String] { num.map { String($0) }}
    var greens: Int = 0
    var greenflipped: Bool = false
    var yellows: Int = 0
    var yellowflipped: Bool = false
    var bg = Color(.systemBackground)
}
