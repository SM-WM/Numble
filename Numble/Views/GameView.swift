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
    @State private var showSettings = false
    
    var body: some View {
        ZStack{
            NavigationView {
            
            VStack(alignment: .center) {
                
                Spacer()
                    .frame(height: 10)
                
                HStack (spacing: Global.colSpacing*4) {
                    
                    Text("\(dm.timeString)")
                            .font(.title.monospaced())
                            .fontWeight(.light)
                            .foregroundColor(Color.red)
                            .frame(width: (Global.tileSize*4) + (Global.colSpacing*3), height: Global.rowSpacing*3.5, alignment: .center)
                            .font(.system(size: 22, weight: .regular))
                            .overlay(
                                RoundedRectangle(cornerRadius: Global.cornerRadius)
                                        .stroke(Color.primary, lineWidth: Global.lineWidth)
                                    )
                    
                    Text("score")
                        .fontWeight(.light)
                        .frame(width: Global.tileSize, height: Global.rowSpacing*3.5, alignment: .center)
                        .font(.system(size: 16, weight: .regular))
                        .overlay(
                                RoundedRectangle(cornerRadius: Global.cornerRadius)
                                    .stroke(Color.primary, lineWidth: Global.lineWidth)
                                )
                }
                
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: Global.rowSpacing) {
                        //$dm.guesses.count - 1
                        ForEach(0...9, id: \.self) { index in
                                GuessView(guess: $dm.guesses[index])
                            
                        }
                    }
                    .padding()
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
                                showSettings.toggle()
                            } label: {
                                Label("Settings", systemImage: "gearshape.fill")
                            }
                            .padding(.leading)
                            
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
                            NavigationLink(destination: StatisticsView()) {
                                Label("Statistics", systemImage: "chart.bar")
                            }
                            .padding()
//                            Button{
//                                withAnimation{dm.showStats.toggle()}
//                            } label: {
//                                Image(systemName: "chart.bar")
//                            }
                            
                            if !dm.inPlay{
                                Button {
                                    dm.newGame()
                                } label: {
                                    Text("New")
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                }
                .sheet(isPresented: $showHelp) {
                    HelpView()
                }
                .sheet(isPresented: $showSettings) {
                    SettingsView()
                }
                .overlay(alignment: .top){
                    if let toastText = dm.toastText{
                        ToastView(toastText: toastText)
                            .offset(y: 20)
                    }
                }
        }
            
            if dm.showStats{
            StatisticsView()
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
