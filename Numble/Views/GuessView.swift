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

        HStack (spacing: Global.colSpacing*3) {
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
                
            }
                
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

struct scoreTile: View {
    
    @Binding var guess: Guess
    
    let idx: Int
    
    var body: some View {
        FlipView(isFlipped: $guess.scoreFlipped[idx]) {
            ZStack {
                RoundedRectangle(cornerRadius: Global.cornerRadius)
                    .stroke(Color.primary, lineWidth: Global.lineWidth)
                    .frame(width: Global.scoreTileSize, height: Global.scoreTileSize)
                RoundedRectangle(cornerRadius: Global.cornerRadius)
                    .fill(Color.systemBackground)
                    .frame(width: Global.scoreTileSize, height: Global.scoreTileSize)
            }
        } back: {
            ZStack {
                RoundedRectangle(cornerRadius: Global.cornerRadius)
                    .stroke(Color.primary, lineWidth: Global.lineWidth)
                    .frame(width: Global.scoreTileSize, height: Global.scoreTileSize)
                RoundedRectangle(cornerRadius: Global.cornerRadius)
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
