//
//  GameView.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/23/22.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: NumbleDm
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                    .frame(height: 8)
                
                HStack (spacing: 5) {
                    Text("00:56:40:88")
                        .fontWeight(.light)
                        .foregroundColor(Color.red)
                        .frame(width: 235, height: 35, alignment: .center)
                        .font(.system(size: 28, weight: .regular))
                        .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 2)
                                )
                    
                    Spacer()
                        .frame(width: 6)
                    
                    Text("score")
                        .fontWeight(.light)
                        .frame(width: 55, height: 35, alignment: .center)
                        .font(.system(size: 20, weight: .regular))
                        .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 2)
                                )
                }
                
                
                ScrollView {
                    LazyVStack(spacing: 5) {
                        Spacer()
                            .frame(height: 1)
                        GuessView(guess: $dm.guesses[0])
                        GuessView(guess: $dm.guesses[1])
                        GuessView(guess: $dm.guesses[2])
                        GuessView(guess: $dm.guesses[3])
                        GuessView(guess: $dm.guesses[4])
                        GuessView(guess: $dm.guesses[5])
                    }
                }
            }
            
            .navigationViewStyle(.stack)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape.fill")
                            }
                            Button {
                                
                            } label: {
                                Image(systemName: "questionmark.circle")
                            }
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Numble")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "chart.bar")
                        }
                    }
                }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .previewDevice("iPhone 13 Pro")
            .previewInterfaceOrientation(.portrait)
            .environmentObject(NumbleDm())
    }
}
