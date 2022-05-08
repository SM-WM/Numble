//
//  DataModel.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//
import SwiftUI

class NumbleDm: ObservableObject {
    @Published var guesses: [Guess] = []
    @Published var showStats = false
    
    var selectedNum: String = ""
    var currentNum: String = ""
    var tryIdx = 0
    var level = Double(Global.level)
    var gameOver = false
    var currentStats: Statistic
    
//  Control booleans
    var inPlay = false
    var disableKeyboard: Bool { !inPlay || currentNum.count == Global.level }
    
    init() {
        currentStats = Statistic.loadStat()
        gameOver = true
    }
    
// MARK: - Setup
   func newGame() {
       inPlay = true
       gameOver = false
       resetDefaults()
       selectRandomNumber()
       startTimer()
       print("selected number is \(selectedNum)")
   }
   
   
   // MARK: - Game
   func selectRandomNumber() {
       var digits: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
       digits.shuffle()
       selectedNum = Array(digits[0..<Global.level]).joined(separator: "")
   }
   
   func resetDefaults() {
       guesses = []
       tryIdx = 0
       timeElapsed = 1
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
        inPlay = false
        if currentNum == selectedNum {
            setScoreColors()
            revealScores(for: tryIdx)
            print("You Win")
            print ("It took you \(tryIdx + 1) tries and time: \(timeString)")
            DispatchQueue.main.asyncAfter(deadline: .now() + (self.level + 1.0) * 0.2) {
                self.timer.invalidate()
                if(self.tryIdx<Global.allowedTries){self.showToast(with: self.toastWords[self.tryIdx])}
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + (self.level + 1.0) * 0.3) {
                self.showStats.toggle()
                self.gameOver = true
            }
            currentStats.update(didWin: true, winIdx: tryIdx, winTime: Int(timeElapsed))
            currentNum = ""
        } else {
            if tryIdx < Global.allowedTries - 1 {
                setScoreColors()
                revealScores(for: tryIdx)
                currentNum = ""
                tryIdx += 1
                DispatchQueue.main.asyncAfter(deadline: .now() + (self.level + 1.0) * 0.2) {
                    self.guesses.append(Guess(index: self.tryIdx))
                    self.guesses[self.tryIdx - 1].bg = Color.wrong
                    self.inPlay = true
                }
            } else if tryIdx == 9 {
                setScoreColors()
                revealScores(for: tryIdx)
                gameOver = true
                print("You lose")
                DispatchQueue.main.asyncAfter(deadline: .now() + (self.level + 1.0) * 0.2) {
                    self.guesses[self.tryIdx - 1].bg = Color.wrong
                    self.timer.invalidate()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + (self.level + 1.0) * 0.3) {
                    self.showStats.toggle()
                }
                currentStats.update(didWin: false, winIdx: tryIdx, winTime: Int(timeElapsed))
                showToast(with: selectedNum)
            }
        }
        print(currentStats)
    }
    
    func updateRow() {
        guesses[tryIdx].num = currentNum.padding(toLength: Global.level, withPad: " ", startingAt: 0)
    }
    
    func setScoreColors() {
        var misplaced: Int = 0
        var wrong: Int = 0
        print(tryIdx)
        guesses[tryIdx].scoreColor = []
        
        // add greens and count yellows and greys
        for idx in 0..<Global.level {
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
        for scoreIdx in 0..<Global.level {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(scoreIdx) * 0.2) {
                self.guesses[row].scoreFlipped[scoreIdx].toggle()
            }
        }
    }
    
    //MARK: Time
    
   var timer = Timer()
   
   @Published var timeElapsed = 1
   
   func startTimer() {
       timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
           self.timeElapsed += 1
       }
   }
   
   func timeConverter(_ msecs: Int) -> (Int, Int, Int, Int) {
       return (msecs / 36000, (msecs % 36000) / 600, ((msecs % 36000) % 600) / 10, ((msecs % 36000) % 600) % 10)
   }
   
   var timeString: String {
       let (hours, minutes, seconds, mseconds) = timeConverter(Int(timeElapsed))
       return "\(hours)".paddingToLeft(upTo: 2, using: "0")  + ":" + "\(minutes)".paddingToLeft(upTo: 2, using: "0") + ":" + "\(seconds)".paddingToLeft(upTo: 2, using: "0") + ":" + "\(mseconds)".paddingToLeft(upTo: 2, using: "0")
   }
    
    // MARK: Toast
    
    @Published var toastText: String?
    
    var toastWords = ["Pure Luck!", "Genius", "Genius", "Magnificent", "Magnificent", "Impressive", "Splendid", "Splendid", "Great", "Phew!"]
    
    func showToast(with text: String?){
        withAnimation {
            toastText = text
        }
        withAnimation(Animation.linear(duration: 0.2).delay(3)){
            toastText = nil
        }
    }
}
