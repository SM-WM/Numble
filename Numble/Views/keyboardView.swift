//
//  keyboardView.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI

struct keyboardView: View {
    @EnvironmentObject var dm: NumbleDm
    var body: some View {
        
        let keyboardFirstRow = "0123456".map{ String($0) }
        let keyboardSecondRow = "789".map{ String($0) }
        
        VStack (spacing: 8) {
            
            HStack (spacing: 8) {
                ForEach(keyboardFirstRow, id: \.self) { num in
                    keyButtonView(num: num)
                }
                .disabled(dm.disableKeyboard)
                .opacity(dm.disableKeyboard ? 0.6 : 1)
            }
            
            HStack (spacing: 8) {
                
                // delete button
                Button {
                    dm.deleteChar()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.unused)
                            .frame(width: Global.keyboardWidth*1.8, height: Global.keyboardWidth*3/2)
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.primary, lineWidth: 2)
                            .frame(width: Global.keyboardWidth*1.8, height: Global.keyboardWidth*3/2)
                        Image(systemName: "delete.backward")
                            .font(.system(size: 20*Global.sf))
                            .frame(width: Global.keyboardWidth*1.8, height: Global.keyboardWidth*3/2)
                            .foregroundColor(Color.primary)
                    }
                }
                .disabled(dm.currentNum.count == 0)
                .opacity(dm.currentNum.count == 0 ? 0.6 : 1)
                
                // 7,8,9 buttons
                ForEach(keyboardSecondRow, id: \.self) { num in
                    keyButtonView(num: num)
                }
                .disabled(dm.disableKeyboard)
                .opacity(dm.disableKeyboard ? 0.6 : 1)
                
                if !dm.inPlay{
                    // New Game button
                    Button {
                        dm.newGame()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.systemBackground)
                                .frame(width: Global.keyboardWidth*1.8, height: Global.keyboardWidth*3/2)
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.burgundy, lineWidth: 2)
                                .frame(width: Global.keyboardWidth*1.8, height: Global.keyboardWidth*3/2)
                            Text("New")
                                .font(.system(size: 20*Global.sf, weight: .semibold))
                                .frame(width: Global.keyboardWidth*1.8, height: Global.keyboardWidth*3/2)
                                .foregroundColor(Color.correct)
                        }
                    }
                } else {
                    // Enter button
                    Button {
                        dm.enterNumber()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.unused)
                                .frame(width: Global.keyboardWidth*1.8, height: Global.keyboardWidth*3/2)
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary, lineWidth: 2)
                                .frame(width: Global.keyboardWidth*1.8, height: Global.keyboardWidth*3/2)
                            Text("???")
                                .font(.system(size: 24))
                                .frame(width: Global.keyboardWidth*1.8, height: Global.keyboardWidth*3/2)
                                .foregroundColor(Color.primary)
                        }
                    }
                    .disabled(dm.currentNum.count < 4 || dm.awaitingScores )
                    .opacity(dm.currentNum.count < 4 || dm.awaitingScores ? 0.6 : 1)
                }
                
                
            }
        }
    }
}

struct keyboardView_Previews: PreviewProvider {
    static var previews: some View {
        keyboardView()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
            .environmentObject(NumbleDm())
    }
}
