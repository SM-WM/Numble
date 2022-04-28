//
//  DataModel.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI

class NumbleDm: ObservableObject {
    @Published var guesses: [Guess] = []
    
    var digits: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var selectedNum: String = ""
    var currentNum: String = ""
    var tryIdx = 0
    var inPlay = false
    
    var disableKeyboard: Bool {
        !inPlay || currentNum.count == 4
    }
    
    init() {
        newGame()
    }
    // MARK: - Setup
    func newGame() {
        inPlay = true
        defaults()
        digits.shuffle()
        selectedNum = Array(digits[0...3]).joined(separator: "")
        currentNum = ""
        print("selected number is \(selectedNum)")
    }
    
    func defaults() {
        guesses = []
        guesses.append(Guess(index: tryIdx))
//        for index in 0...guesses.count {
//            guesses.append(Guess(index: index))
//        }
    }
    
    // MARK: - Game
    func addChar(digit: String) {
        currentNum += digit
        updateRow()
    }
    
    func deleteChar() {
        currentNum.removeLast()
        updateRow()
    }
    
    func enterNumber() {
        print("you guessed \(currentNum)")
        
        var misplaced: Int = 0
        var wrong: Int = 0
        
        // add greens and count yellows and greys
        for idx in 0...3 {
            print(Array(currentNum)[idx] == Array(selectedNum)[idx])
            if (Array(currentNum)[idx] == Array(selectedNum)[idx]){
                guesses[tryIdx].scoreColor.append(Color.correct)
            }
            else if (Array(selectedNum).contains(Array(currentNum)[idx])) {
                misplaced += 1
            }
            else {
                wrong += 1
            }
        }
        
        // add misplaced
        if misplaced != 0 {
            for _ in 1...misplaced {
                guesses[tryIdx].scoreColor.append(Color.misplaced)
            }
        }
        
        // add wrong
        if wrong != 0 {
            for _ in 1...wrong {
                guesses[tryIdx].scoreColor.append(Color.wrong)
            }
        }
        print(guesses[tryIdx].scoreColor)
        tryIdx += 1
        print(guesses.count)
    }
    
    func updateRow() {
        guesses[tryIdx].num = currentNum.padding(toLength: 4, withPad: " ", startingAt: 0)
    }
    
}
