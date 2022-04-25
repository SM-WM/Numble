//
//  DataModel.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI

class NumbleDm: ObservableObject {
    @Published var guesses: [Guess] = []
    
    init() {
        newGame()
    }
    // MARK: - Setup
    func newGame() {
        defaults()
    }
    
    func defaults() {
        guesses = []
        for index in 0...10 {
            guesses.append(Guess(index: index))
        }
    }
    
    // MARK: - Game
    func enterNumber() {
        
    }
    
    func deleteChar() {
        
    }
}
