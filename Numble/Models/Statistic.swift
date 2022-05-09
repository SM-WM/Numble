//
//  Statistic.swift
//  Numble
//
//  Created by Srashta Maharjan on 5/5/22.
//
import Charts
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
    
    var performances: [Int] {
        gamesArray.map( {$0.performance })
    }
    
    func dataEntries() -> [ChartDataEntry]{
        return gamesArray.map{ChartDataEntry(x: Double($0.index), y: Double($0.performance))}
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

let goodTime = 30*600 //thirty minutes

struct Game: Codable {
    var index: Int
    var win: Bool
    var time: Int
    var tries: Int
    var performance: Int {
//        let exactP = (triesWeight/tries)+(timeWeight/time)
        let exactP = ((Global.allowedTries*10/(tries))+(goodTime/time))*10
        return (win ? exactP : exactP / 4)
    }
}
