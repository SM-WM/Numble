//
//  GameView.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/23/22.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: NumbleDm
    
    @State private var showHelp = false
    var body: some View {

        ZStack {
            NavigationView {
                VStack {
                    
                    Spacer()
                        .frame(height: 10)
                    
                    HStack (spacing: 8) {
                        
                        Text("\(dm.timeString)")
                                .font(.title.monospaced())
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
                    
                    
                    ScrollView(showsIndicators: true) {
                        LazyVStack(spacing: 10) {
                            Spacer()
                                .frame(height: 0)
                            ForEach(0...$dm.guesses.count - 1, id: \.self) { index in
                                GuessView(guess: $dm.guesses[index])
                            }
                        }
                    }
                    
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
                                    showHelp.toggle()
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
        .sheet(isPresented: $showHelp) {
            HelpView()
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
