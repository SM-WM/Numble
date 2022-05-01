//
//  NumbleApp.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/23/22.
//

import SwiftUI

@main
struct NumbleApp: App {
    @StateObject var dm = NumbleDm()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
