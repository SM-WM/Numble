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
        
        VStack (spacing: 5) {
            
            HStack (spacing: 5) {
                ForEach(keyboardFirstRow, id: \.self) { num in
                    keyButtonView(num: num)
                }
            }
            
            HStack (spacing: 5) {
                Button {
                    dm.enterNumber()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.unused)
                            .frame(width: 80, height: 60)
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.primary, lineWidth: 2)
                            .frame(width: 80, height: 60)
                        Image(systemName: "delete.backward")
                            .font(.system(size: 20))
                            .frame(width: 80, height: 60)
                            .foregroundColor(Color.primary)
                    }
                }
                ForEach(keyboardSecondRow, id: \.self) { num in
                    keyButtonView(num: num)
                }
                Button {
                    dm.deleteChar()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.unused)
                            .frame(width: 80, height: 60)
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.primary, lineWidth: 2)
                            .frame(width: 80, height: 60)
                        Text("⏎")
                            .font(.system(size: 24))
                            .frame(width: 80, height: 60)
                            .foregroundColor(Color.primary)
                    }
                }
            }
        }
    }
}

struct keyboardView_Previews: PreviewProvider {
    static var previews: some View {
        keyboardView()
    }
}
