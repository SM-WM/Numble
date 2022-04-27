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
                    .frame(height: 10)
                
                HStack (spacing: 8) {
                    Text("00:56:40:88")
                        .fontWeight(.light)
                        .foregroundColor(Color.red)
                        .frame(width: 262, height: 40, alignment: .center)
                        .font(.system(size: 28, weight: .regular))
                        .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 2)
                                )
                    
                    Spacer()
                        .frame(width: 6)
                    
                    Text("score")
                        .fontWeight(.light)
                        .frame(width: 62, height: 40, alignment: .center)
                        .font(.system(size: 20, weight: .regular))
                        .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 2)
                                )
                }
                
                
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        Spacer()
                            .frame(height: 0)
                        ForEach(0...8, id: \.self) {index in
                            GuessView(guess: $dm.guesses[index])
                        }

                    }
                }
                
//                Spacer()
//                    .frame(height: 20)
                
                keyboardView()
                    .padding(.top)
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
