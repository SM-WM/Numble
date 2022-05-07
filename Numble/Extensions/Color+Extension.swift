//
//  Color+Extension.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI

extension Color {
    static var wrong: Color {
        Color(UIColor(named: "wrong")!)
    }
    static var misplaced: Color {
        Color(UIColor(named: "misplaced")!)
    }
    static var correct: Color {
        Color(UIColor(named: "correct")!)
    }
    static var unused: Color {
        Color(UIColor(named: "unused")!)
    }
    static var systemBackground: Color {
        Color(.systemBackground)
    }
}

extension RangeReplaceableCollection where Self: StringProtocol {
    func paddingToLeft(upTo length: Int, using element: Element = " ") -> SubSequence {
        return repeatElement(element, count: Swift.max(0, length-count)) + suffix(Swift.max(count, count-length))
    }
}
