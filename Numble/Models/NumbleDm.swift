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
    
    @Published var timeElapsed = 0.0
    var timeString: String {
//        let milliseconds = "\((self.timeElapsed % 3600) % 60)".paddingToLeft(upTo: 2, using: "0")
//        let seconds = "\((self.timeElapsed / 1000) % 60)".paddingToLeft(upTo: 2, using: "0")
//        let minutes = "\((self.timeElapsed / (1000*60)) % 60)".paddingToLeft(upTo: 2, using: "0")
//        let hours = "\((self.timeElapsed / (1000*60*60)) % 24)".paddingToLeft(upTo: 2, using: "0")
        let hours = "\(Int((self.timeElapsed / (1000 * 60 * 60)).truncatingRemainder(dividingBy: 24)))".paddingToLeft(upTo: 2, using: "0")
        let minutes = "\(Int((self.timeElapsed / (1000 * 60)).truncatingRemainder(dividingBy: 60)))".paddingToLeft(upTo: 2, using: "0")
        let seconds = "\(Int((self.timeElapsed / 1000).truncatingRemainder(dividingBy: 60)))".paddingToLeft(upTo: 2, using: "0")
        let milliseconds = "\(Int((self.timeElapsed).truncatingRemainder(dividingBy: 1000)))".paddingToLeft(upTo: 3, using: "0")
        
        return hours + ":" + minutes + ":" + seconds + ":" + milliseconds}
    var timer = Timer()
    
    var disableKeyboard: Bool {
        !inPlay || currentNum.count == 4
    }
    
    init() {
        newGame()
    }
    
    // MARK: - Setup
    func newGame() {
        inPlay = true
        tryIdx = 0
        defaults()
        digits.shuffle()
        selectedNum = Array(digits[0...3]).joined(separator: "")
        currentNum = ""
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { timer in
            self.timeElapsed += 1
        }
        print("selected number is \(selectedNum)")
    }
    
    func defaults() {
        guesses = []
        guesses.append(Guess(index: tryIdx))
        timeElapsed = 0
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
        if currentNum == selectedNum {
            setScoreColors()
            revealScores(for: tryIdx)
            print("You Win")
            print ("It took you \(tryIdx + 1) tries and time: \(timeString)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 6.0 * 0.25) {
                self.timer.invalidate()
            }
            currentNum = ""
            inPlay = false
        } else {
            setScoreColors()
            revealScores(for: tryIdx)
            currentNum = ""
            tryIdx += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 6.0 * 0.25) {
                self.guesses.append(Guess(index: self.tryIdx))
                self.guesses[self.tryIdx - 1].bg = Color.wrong
            }
        }
        
        print(guesses.count)
        
        
    }
    
    func updateRow() {
        guesses[tryIdx].num = currentNum.padding(toLength: 4, withPad: " ", startingAt: 0)
    }
    
    func setScoreColors() {
        var misplaced: Int = 0
        var wrong: Int = 0
        
        // add greens and count yellows and greys
        for idx in 0...3 {
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
    }
    
    func revealScores (for row: Int) {
        for scoreIdx in 0...3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(scoreIdx) * 0.25) {
                self.guesses[row].scoreFlipped[scoreIdx].toggle()
            }
        }
    }
    
    
}
