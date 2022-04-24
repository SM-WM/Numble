//
//  GuessView.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/24/22.
//

import SwiftUI

struct GuessView: View {
    @Binding var guess: Guess
    var body: some View {
        HStack(spacing: 5) {
//            Spacer()
            ForEach(0...3, id: \.self) { index in
                Text(guess.numArr[index])
                    .foregroundColor(.primary)
                    .frame(width: 50, height: 50, alignment: .center)
                    .background(Color.systemBackground)
                    .font(.system(size: 35, weight: .heavy))
                    .border(Color(.secondaryLabel), width: 2)
            }
            Spacer()
                .frame(width: 2)
            Divider()
                .frame(width: 4, height: 40)
                .background(Color(.secondaryLabel))
            Spacer()
                .frame(width: 2)
            
            Text("\(guess.greens)")
                .foregroundColor(.primary)
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.unused)
                .font(.system(size: 35, weight: .regular))
                .border(Color(.secondaryLabel), width: 2)
            
            Text("\(guess.yellows)")
                .foregroundColor(.primary)
                .frame(width: 50, height: 50,alignment: .center)
                .background(Color.unused)
                .font(.system(size: 35, weight: .regular))
                .border(Color(.secondaryLabel), width: 2)
//            Spacer()
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(guess: .constant(Guess(index: 0)))
    }
}
