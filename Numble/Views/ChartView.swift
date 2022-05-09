//
//  ChartView.swift
//  Numble
//
//  Created by Srashta Maharjan on 5/9/22.
//

import Charts
import SwiftUI

struct ChartView: UIViewRepresentable {
    @EnvironmentObject var dm: NumbleDm
    let entries: [ChartDataEntry]
    func makeUIView(context: Context) -> LineChartView {
        return LineChartView()
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        let dataSet = LineChartDataSet(entries: entries)
        uiView.data = LineChartData(dataSet: dataSet)
        formatDataSet(dataSet: dataSet)
        uiView.rightAxis.enabled = false
        formatXAxis(xAxis: uiView.xAxis)
    }
    
    func formatDataSet(dataSet: LineChartDataSet){
        dataSet.colors = [.darkGray]
    }
    
    func formatXAxis(xAxis: XAxis) {
            xAxis.labelPosition = .bottom
        }
    

}

//struct ChartView_Previews: PreviewProvider{
//    @EnvironmentObject var dm: NumbleDm
//    static var previews: some View{
////        ChartView(entries:Statistic.dataEntries(gameData: [Game(index: 0, win: true, time: 374, tries: 3), Game(index: 1, win: true, time: 885, tries: 7), Game(index: 2, win: true, time: 213, tries: 3)]))
//            //.environmentObject(NumbleDm())
//        ChartView(entries: [ChartDataEntry(x: 1.0, y:2.0),ChartDataEntry(x: 1.0, y:2.0), ChartDataEntry(x: 1.0, y:2.0), ChartDataEntry(x: 1.0, y:2.0), ChartDataEntry(x: 1.0, y:2.0), ChartDataEntry(x: 1.0, y:2.0), ChartDataEntry(x: 1.0, y:2.0)])
//    }
//}
