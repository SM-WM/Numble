//
//  keyButtonView.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI

struct keyButtonView: View {
    @EnvironmentObject var dm: NumbleDm
    var num: String
    var body: some View {
        Button {
            dm.addChar(digit: num)
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.unused)
                    .frame(width: Global.keyboardWidth, height: Global.keyboardWidth*3/2)
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.primary, lineWidth: 2)
                    .frame(width: Global.keyboardWidth, height: Global.keyboardWidth*3/2)
                Text(num)
                    .font(.system(size: 20*Global.sf))
                    .frame(width: Global.keyboardWidth, height: Global.keyboardWidth*3/2)
                    .foregroundColor(Color.primary)
            }
        }
    }
}

struct keyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        keyButtonView(num: "3")
    }
}
