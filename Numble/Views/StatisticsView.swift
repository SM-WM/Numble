//
//  StatisticsView.swift
//  Numble
//
//  Created by Walter Mwaniki on 5/1/22.
//

import SwiftUI

struct StatisticsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image(systemName: "chart.xyaxis.line")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 60)
                    .foregroundColor(Color("correct"))
                Text("Statistics go here!")
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
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
            .previewDevice("iPhone 13 Pro")
    }
}
