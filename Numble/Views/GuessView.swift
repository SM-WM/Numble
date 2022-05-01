//
//  GuessView.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI


struct GuessView: View {
    @Binding var guess: Guess
    var body: some View {

        VStack {
            HStack(spacing: Global.colSpacing) {
                ForEach(0...3, id: \.self) { index in
                    Text(guess.numArr[index])
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(.primary)
                        .frame(width: Global.tileSize, height: Global.tileSize, alignment: .center)
                        .background(guess.bg)
                        .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 2)
                                )
                }
                
                Spacer()
                    .frame(width: 6)
                
                VStack (spacing: Global.tinySpacing) {
                    
                    HStack (spacing: Global.tinySpacing) {
                        scoreTile(guess: $guess, idx: 0)
                        scoreTile(guess: $guess, idx: 1)
                    }
                    
                    HStack (spacing: Global.tinySpacing) {
                        scoreTile(guess: $guess, idx: 2)
                        scoreTile(guess: $guess, idx: 3)
                    }
                }
            }
        }
    }
}

struct scoreTile: View {
    
    @Binding var guess: Guess
    
    let idx: Int
    let cornerRadius = 5.0
//    let tileSize = 28.0
    
    var body: some View {
        FlipView(isFlipped: $guess.scoreFlipped[idx]) {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.primary, lineWidth: 2)
                    .frame(width: Global.scoreTileSize, height: Global.scoreTileSize)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.systemBackground)
                    .frame(width: Global.scoreTileSize, height: Global.scoreTileSize)
            }
        } back: {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.primary, lineWidth: 2)
                    .frame(width: Global.scoreTileSize, height: Global.scoreTileSize)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(guess.scoreColor[idx])
                    .frame(width: Global.scoreTileSize, height: Global.scoreTileSize)
            }
        }
    }
}  

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(guess: .constant(Guess(index: 0)))
    }
}
