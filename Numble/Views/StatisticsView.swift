//
//  StatisticsView.swift
//  Numble
//
//  Created by Walter Mwaniki on 5/1/22.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var dm: NumbleDm
    var body: some View {
        VStack(spacing: 10) {
            HStack{
                Spacer()
                Button {
                    withAnimation {
                        dm.showStats.toggle()
                    }
                } label: {
                    Text("X")
                }
                .offset(x:20, y: 10)
            }
            Text("STATISTICS")
                .font(.headline)
                .fontWeight(.bold)
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
                ForEach (0..<10) { index in
                    HStack {
                        Text("\(index + 1)")
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
                                Rectangle()
                                    .fill((dm.tryIdx == index && dm.gameOver)
                                          ? Color.correct
                                          : Color.wrong)
                                    .frame(width: CGFloat(dm.currentStats.frequencies[index])
                                    / CGFloat(maxValue) * 210,
                                    height: 20)
                                    .overlay(
                                        Text("\(dm.currentStats.frequencies[index])")
                                            .foregroundColor(.white)
                                            .padding(.horizontal,5),
                                        alignment: .trailing
                                    )
                            }
                        }
                        Spacer()
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 40)
        .frame(width: 320, height: 500)
        .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.systemBackground))
        .padding()
        .shadow(color: .black.opacity(0.3), radius: 10)
        .offset(y: -70)
        .onAppear{
            print(dm.currentStats)
        }
    }
}
    
    
    
    
//    @Environment(\.dismiss) var dismiss
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .center) {
//                Image(systemName: "chart.xyaxis.line")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .padding(.horizontal, 60)
//                    .foregroundColor(Color("correct"))
//                Text("Statistics go here!")
//            }
//            .navigationViewStyle(.stack)
//                .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("Statistics")
//                        .font(.system(size: 30.0, weight: .thin, design: .monospaced))
//                        .foregroundColor(.primary)
//                }
//            }
//        }
//
//
//
//    }


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

