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
            ScrollView {
                VStack(spacing: 15) {
                    HStack(alignment: .top) {
                        SingleStat(value: dm.currentStats.games,
                                   text: "Played")
                        if dm.currentStats.games != 0 {
                            SingleStat(value: Int(100 * dm.currentStats.wins/dm.currentStats.games),
                                       text: "Win %")
                        }
                        SingleStat(value: dm.currentStats.streak,
                                   text: "Current Streak")
                            .fixedSize(horizontal: false, vertical: true)
                        SingleStat(value: dm.currentStats.maxStreak,
                                   text: "MAX Streak")
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Text("GUESS DISTRIBUTION")
                        .font(.headline)
                        .fontWeight(.bold)
                    VStack(spacing: 5) {
                        ForEach (0..<11) { index in
                            HStack {
                                let indexNum = "\(index + 1)".paddingToLeft(upTo: 2, using: " ")

                                if index == 10 {
                                    Text(" x")
                                        .font(.system(size: 16, weight: .medium, design: .monospaced))
                                        .foregroundColor(Color(red: 0.537, green: 0.008, blue: 0.243))
                                } else {
                                    Text(indexNum)
                                        .font(.system(size: 16, weight: .medium, design: .monospaced))
                                }
                                
                                if dm.currentStats.frequencies[index] == 0 {
                                    Rectangle()
                                        .fill(Color.wrong)
                                        .frame(width: 22, height: 20)
                                        .overlay(
                                         Text("0")
                                            .foregroundColor(.white)
                                        )
                                } else {
                                    if let maxValue = dm.currentStats.frequencies.max() {
                                        if (dm.tryIdx == index && index < 10 && dm.currentStats.gamesArray[dm.currentStats.gamesArray.count-1].win  && dm.gameOver) {
                                            Rectangle()
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
                                            Rectangle()
                                            .fill(Color(red: 0.537, green: 0.008, blue: 0.243))
                                            .frame(width: CGFloat(dm.currentStats.frequencies[index])
                                                   / CGFloat(maxValue) * Global.tileSize * 5,
                                            height: 20)
                                            .overlay(
                                                Text("\(dm.currentStats.frequencies[index])")
                                                    .foregroundColor(.white)
                                                    .padding(.horizontal,5),
                                                alignment: .trailing
                                            )
                                        } else {
                                            Rectangle()
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
                    
                    .navigationViewStyle(.stack)
                        .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Statistics")
                                .font(.system(size: 30.0, weight: .thin, design: .monospaced))
                                .foregroundColor(.primary)
                        }
                        
                    }
                }
            }
            .padding(20)
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
                .font(.largeTitle)
            Text(text)
                .font(.caption)
                .frame(width: 50)
                .multilineTextAlignment(.center)
        }
    }
}
