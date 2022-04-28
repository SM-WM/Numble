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
//        let _ = print(Color.primary)
//        let _ = print(guess.scoreColor[2])
        VStack {
            HStack(spacing: 8) {
                ForEach(0...3, id: \.self) { index in
                    Text(guess.numArr[index])
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(.primary)
                        .frame(width: 60, height: 60, alignment: .center)
                        .background(Color.systemBackground)
                        .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 2)
                                )
                }
                .opacity(0.6)
                
                Spacer()
                    .frame(width: 6)
                
                VStack (spacing: 6) {
                    
                    HStack (spacing: 6) {
                        
                        
                            FlipView(isFlipped: $guess.scoreFlipped[0]) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 2)
                                        .frame(width: 28, height: 28)
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.systemBackground)
                                        .frame(width: 28, height: 28)
                                }
                            } back: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 2)
                                        .frame(width: 28, height: 28)
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(guess.scoreColor[0])
                                        .frame(width: 28, height: 28)
                                }
                            }
                        
                        
                            FlipView(isFlipped: $guess.scoreFlipped[1]) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 2)
                                        .frame(width: 28, height: 28)
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.systemBackground)
                                        .frame(width: 28, height: 28)
                                }
                            } back: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 2)
                                        .frame(width: 28, height: 28)
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(guess.scoreColor[1])
                                        .frame(width: 28, height: 28)
                                }
                            }
                        
                        
                    }
                    
                    HStack (spacing: 6) {
                            
                        FlipView(isFlipped: $guess.scoreFlipped[2]) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 2)
                                    .frame(width: 28, height: 28)
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.systemBackground)
                                    .frame(width: 28, height: 28)
                            }
                        } back: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 2)
                                    .frame(width: 28, height: 28)
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(guess.scoreColor[2])
                                    .frame(width: 28, height: 28)
                            }
                        }
                        
                        
                        FlipView(isFlipped: $guess.scoreFlipped[3]) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 2)
                                    .frame(width: 28, height: 28)
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.systemBackground)
                                    .frame(width: 28, height: 28)
                            }
                        } back: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 2)
                                    .frame(width: 28, height: 28)
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(guess.scoreColor[3])
                                    .frame(width: 28, height: 28)
                            }
                        }
                    }
                }
                
            }
            
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(guess: .constant(Guess(index: 0)))
    }
}
