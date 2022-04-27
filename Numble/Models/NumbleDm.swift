//
//  DataModel.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI

class NumbleDm: ObservableObject {
    @Published var guesses: [Guess] = []
    
    var selectedNum = ""
    var digits: [String] = ["0","1","2","3","4","5","6","7","8","9"]
    var currentNum = ""
    var tryIndex = 0
    var inPlay = false
    
    var gameStarted : Bool {
        !currentNum.isEmpty || tryIndex > 0
    }
    
    var disabledKeys: Bool {
        !inPlay || currentNum.count == 4
    }
    
    init() {
        newGame()
    }
    // MARK: - Setup
    func newGame() {
        defaults()
        digits.shuffle()
        let num = digits[0...3]
        selectedNum = num.joined(separator: "")
        currentNum = ""
        inPlay = true
    }
    
    func defaults() {
        guesses = []
        for index in 0...10 {
            guesses.append(Guess(index: index))
        }
    }
    
    // MARK: - Game
    func addToCurrentNum(_ num: String){
        currentNum += num
        updateRow()
    }
    
    func enterNumber() {
        print(currentNum)
    }
    
    func deleteChar() {
        currentNum.removeLast()
        updateRow()
    }
    
    func updateRow (){
        let guessNum = currentNum.padding(toLength: 4, withPad: " ", startingAt: 0)
        guesses[tryIndex].num = guessNum
    }
    
}
