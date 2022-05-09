//
//  StatisticsView.swift
//  Numble
//
//  Created by Walter Mwaniki on 5/1/22.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var dm: NumbleDm
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            
            VStack(spacing: 15) {
                VStack {
                    HStack(alignment: .top) {
                        SingleStat(value: dm.currentStats.games,
                                   text: "Played")
                        .frame(width: Global.tileSize, height: Global.tileSize*1.25, alignment: .top)
                        .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 1)
                                )
                        if dm.currentStats.games != 0 {
                            SingleStat(value: Int(100 * dm.currentStats.wins/dm.currentStats.games),
                                       text: "Win %")
                            .frame(width: Global.tileSize, height: Global.tileSize*1.25, alignment: .top)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 1)
                                    )
                        }
                        SingleStat(value: dm.currentStats.streak,
                                   text: "Current Streak")
                        .frame(width: Global.tileSize, height: Global.tileSize*1.25, alignment: .top)
                        .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 1)
                                )
                        SingleStat(value: dm.currentStats.maxStreak,
                                   text: "MAX Streak")
                            .frame(width: Global.tileSize, height: Global.tileSize*1.25, alignment: .top)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 1)
                                    )
                            
                    }
                    HStack(alignment: .top) {
                        if dm.currentStats.games != 0 {
                            let xpCaption = dm.gameOver ? "Current XP" : "Previous XP"
                            SingleStat(value: dm.currentStats.performances[dm.currentStats.games-1],
                                       text: xpCaption)
                            .frame(width: Global.tileSize*2, height: Global.tileSize, alignment: .center)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 1)
                                    )
                            
                            SingleStat(value: dm.currentStats.performances.reduce(0, +)/dm.currentStats.games,
                                       text: "Average XP")
                            .frame(width: Global.tileSize*2, height: Global.tileSize, alignment: .center)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 1)
                                    )
                        }
                    }
                }
                .padding(.top, 20)
                
                ScrollView (showsIndicators: false) {
                    
                    Divider()
                        .frame(width: Global.tileSize*2, height: 1)
                        .background(Color.blue)
                        .padding(.vertical, 15)
                    Text("GUESS DISTRIBUTION")
                        .font(.system(size: 18.0, weight: .semibold, design: .monospaced))
                    
                    VStack(spacing: 5) {
                        ForEach (0..<11) { index in
                            HStack {
                                let indexNum = "\(index + 1)".paddingToLeft(upTo: 2, using: " ")

                                if index == 10 {
                                    Text(" x")
                                        .font(.system(size: 16, weight: .medium, design: .monospaced))
                                        .foregroundColor(Color.burgundy)
                                } else {
                                    Text(indexNum)
                                        .font(.system(size: 16, weight: .medium, design: .monospaced))
                                }
                                
                                if dm.currentStats.frequencies[index] == 0 {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.wrong)
                                        .frame(width: 22, height: 20)
                                        .overlay(
                                         Text("0")
                                            .foregroundColor(.white)
                                        )
                                } else {
                                    if let maxValue = dm.currentStats.frequencies.max() {
                                        if (dm.tryIdx == index && index < 10 && dm.currentStats.gamesArray[dm.currentStats.gamesArray.count-1].win  && dm.gameOver) {
                                            RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.correct)
                                            .frame(width: CGFloat(dm.currentStats.frequencies[index])
                                                   / CGFloat(maxValue) * Global.tileSize * 5,
                                            height: 20)
                                            .overlay(
                                                Text("\(dm.currentStats.frequencies[index])")
                                                    .foregroundColor(.white)
                                                    .padding(.horizontal,5),
                                                alignment: .trailing
                                            )
                                        } else if (index == 10 && !dm.currentStats.gamesArray[dm.currentStats.gamesArray.count-1].win && dm.gameOver) {
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(Color.burgundy)
                                            .frame(width: CGFloat(dm.currentStats.frequencies[index])
                                                   / CGFloat(maxValue) * Global.tileSize * 4.5,
                                            height: 20)
                                            .overlay(
                                                Text("\(dm.currentStats.frequencies[index])")
                                                    .foregroundColor(.white)
                                                    .padding(.horizontal,5),
                                                alignment: .trailing
                                            )
                                        } else {
                                            RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.wrong)
                                            .frame(width: CGFloat(dm.currentStats.frequencies[index])
                                                   / CGFloat(maxValue) * Global.tileSize * 5,
                                            height: 20)
                                            .overlay(
                                                Text("\(dm.currentStats.frequencies[index])")
                                                    .foregroundColor(.white)
                                                    .padding(.horizontal,5),
                                                alignment: .trailing
                                            )
                                        }
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                    
                    Divider()
                        .frame(width: Global.tileSize*2, height: 1)
                        .background(Color.blue)
                        .padding(.vertical, 15)
                    
                    Text("XP HISTORY")
                        .font(.system(size: 18.0, weight: .semibold, design: .monospaced))
                    
                    Image(systemName: "chart.xyaxis.line")
                        .font(Font.system(size: 250, weight: .ultraLight))
                        .foregroundColor(Color.burgundy)
                        .padding(.horizontal)
                        .padding(.bottom, 270)
                    
                    .navigationViewStyle(.stack)
                        .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Statistics")
                                .font(.system(size: 30.0, weight: .thin, design: .monospaced))
                                .foregroundColor(Color.blue)
                        }
                        
                    }
                }
            }
            
            .padding(.horizontal, 20)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
           // .previewDevice("iPhone 13 Pro")
            .environmentObject(NumbleDm())
    }
}

struct SingleStat: View {
    let value: Int
    let text: String
    var body: some View{
        VStack{
            Text("\(value)")
                .font(.system(size: 24.0, weight: .thin, design: .monospaced))
                .foregroundColor(.primary)
                .padding(.top, 5)
                .padding(.horizontal, 5)
            Text(text)
                .font(.caption)
                .foregroundColor(Color.burgundy)
                .multilineTextAlignment(.center)
                .padding(.bottom, 5)
                .padding(.horizontal, 5)
        }
    }
}
