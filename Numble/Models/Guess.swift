//
//  Guess.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI

struct Guess {
    let index: Int
    var num = "    "
    var numArr: [String] { num.map { String($0) }}
    var correct: Int = 0
    var misplaced: Int = 0
    var wrong: Int = 0
    var scores = [Color](repeating: .systemBackground, count: 4)
    var scoreFlipped = [Bool](repeating: false, count: 4)
    var bg = Color(.systemBackground)
}
