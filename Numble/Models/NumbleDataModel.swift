//
//  DataModel.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI

class NumbleDataModel: ObservableObject {
    
    @Published var guesses: [Guess] = []
    
    var selectedNum: String = ""
    var currentNum: String = ""
    var tryIdx = 0
    
    var inPlay = false
    var disableKeyboard: Bool { !inPlay || currentNum.count == 4 }
    
    init() {
        newGame()
    }
    
    // MARK: - Setup
    func newGame() {
        inPlay = true
        resetDefaults()
        selectRandomNumber()
        print("selected number is \(selectedNum)")
    }
    
    
    // MARK: - Game
    func selectRandomNumber() {
        var digits: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        digits.shuffle()
        selectedNum = Array(digits[0...3]).joined(separator: "")
    }
    
    func resetDefaults() {
        guesses = []
        tryIdx = 0
        timeElapsed = 0
        currentNum = ""
        guesses.append(Guess(index: tryIdx))
    }
    
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
            if tryIdx == 0 {
                startTimer()
            }
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
    
    // MARK: - Time
    
    var timer = Timer()
    
    @Published var timeElapsed = 0.01
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.timeElapsed += 1
        }
    }
    
    func timeConverter(_ msecs: Int) -> (Int, Int, Int, Int) {
        return (msecs / 360000, (msecs % 360000) / 6000, ((msecs % 360000) % 6000) / 100, ((msecs % 360000) % 6000) % 100)
    }
    
    var timeString: String {
        let (hours, minutes, seconds, mseconds) = timeConverter(Int(timeElapsed))
        return "\(hours)".paddingToLeft(upTo: 2, using: "0")  + ":" + "\(minutes)".paddingToLeft(upTo: 2, using: "0") + ":" + "\(seconds)".paddingToLeft(upTo: 2, using: "0") + ":" + "\(mseconds)".paddingToLeft(upTo: 2, using: "0")
    }
    
    
}
