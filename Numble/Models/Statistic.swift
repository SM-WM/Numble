//
//  Statistic.swift
//  Numble
//
//  Created by Srashta Maharjan on 5/5/22.
//

import Foundation

struct Statistic: Codable {
    var frequencies = [Int](repeating: 0, count: Global.allowedTries + 1)
    var gamesArray: [Game] = []
    var streak = 0
    var maxStreak = 0
    
    var games:Int {
        gamesArray.count
    }

    var wins: Int {
        frequencies[0..<Global.allowedTries].reduce(0, +)
    }
    
    mutating func update(didWin: Bool, winIdx: Int? = nil, winTime: Int) {
        let newGame = Game(index: games, win: didWin, time: winTime, tries: winIdx! + 1)
        gamesArray.append(newGame)
        streak = didWin ? streak + 1 : 0
        if didWin {
            frequencies[winIdx!] += 1
            maxStreak = max(maxStreak, streak)
        } else {
            frequencies[Global.allowedTries] += 1
        }
        saveStat()
    }
    
    func saveStat() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: "Stat")
        }
    }
    
    static func loadStat() -> Statistic {
        if let savedStat = UserDefaults.standard.object(forKey: "Stat") as? Data {
            if let currentStat = try? JSONDecoder().decode(Statistic.self, from: savedStat) {
                return currentStat
            } else {
                return Statistic()
            }
        } else {
            return Statistic()
        }
    }
}

let timeWeight = 36000
let triesWeight = 10

struct Game: Codable {
    var index: Int
    var win: Bool
    var time: Int
    var tries: Int
    var performance: Int {
        return (win ? (triesWeight/tries)+(timeWeight/time) : (triesWeight/tries)+(timeWeight/time) * 0.25}
}
