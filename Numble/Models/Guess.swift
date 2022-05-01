//
//  Guess.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI

struct Guess {
    var index: Int
    var num = "    "
    var numArr: [String] { num.map { String($0) }}
    var scoreColor = [Color](repeating: .systemBackground, count: Global.level)
    var scoreFlipped = [Bool](repeating: false, count: Global.level)
    var bg = Color(.systemBackground)
}
