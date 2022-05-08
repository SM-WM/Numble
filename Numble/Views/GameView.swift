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

            NavigationView {
            
            VStack(alignment: .center) {
                
                Spacer()
                    .frame(height: 10)
                
                HStack (spacing: Global.colSpacing*3) {
                    HStack (spacing: Global.colSpacing) {
                        
                        Text("\(dm.tryIdx+1)")
                            .font(.system(size: 20, weight: .semibold, design: .monospaced))
                            .foregroundColor(Color.correct)
                            .frame(width: Global.tileSize, height: Global.rowSpacing*3, alignment: .center)
                            .overlay(
                                    RoundedRectangle(cornerRadius: Global.cornerRadius)
                                        .stroke(Color.primary, lineWidth: Global.lineWidth)
                                    )
                        
                        Text("\(dm.timeString)")
                            .foregroundColor(Color.red)
                                .frame(width: (Global.tileSize*3) + (Global.colSpacing*2), height: Global.rowSpacing*3, alignment: .center)
                                .font(.system(size: 20, weight: .regular, design: .monospaced))
                                .overlay(
                                    RoundedRectangle(cornerRadius: Global.cornerRadius)
                                            .stroke(Color.primary, lineWidth: Global.lineWidth)
                                        )
                    }
                    Text("score")
                        .foregroundColor(Color.blue)
                        .frame(width: Global.tileSize, height: Global.rowSpacing*3, alignment: .center)
                        .font(.system(size: 18, weight: .semibold))
                        .overlay(
                                RoundedRectangle(cornerRadius: Global.cornerRadius)
                                    .stroke(Color.primary, lineWidth: Global.lineWidth)
                                )
                }
                
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: Global.rowSpacing) {
                        ForEach(0..<$dm.guesses.count, id: \.self) { index in
                            GuessView(guess: $dm.guesses[index])
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                }
                
                keyboardView()
                    .padding(.top)
            }

            
            .navigationViewStyle(.stack)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            NavigationLink(destination: SettingsView()) {
                                Label("Settings", systemImage: "gearshape.fill")
                            }
                            .padding()
                            
                            Button {
                                showHelp.toggle()
                            } label: {
                                Label("Help", systemImage: "questionmark.circle")
                            }
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Numble")
                            .font(.system(size: 32.0, weight: .thin, design: .monospaced))
                            .foregroundColor(.primary)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack{
                            NavigationLink(destination: StatisticsView(), isActive: $dm.showStats) {
                                Label("Statistics", systemImage: "chart.bar")
                            }
//                            if !dm.inPlay && dm.gameOver{
//                                Button {
//                                    dm.newGame()
//                                } label: {
//                                    Text("New")
//                                        .foregroundColor(.primary)
//                                }
//                                .padding(.trailing)
//                            }
                        }
                    }
                }
                .sheet(isPresented: $showHelp) {
                    HelpView()
                }
                .overlay(alignment: .top){
                    if let toastText = dm.toastText{
                        ToastView(toastText: toastText)
                            .offset(y: 20)
                    }
                }
        }

    }

}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .previewDevice("iPhone 13 Pro")
            .environmentObject(NumbleDm())
    }
}
