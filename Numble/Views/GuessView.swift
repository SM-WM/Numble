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
            ForEach(0...3, id: \.self) { index in
                Text(guess.numArr[index])
                    .foregroundColor(.primary)
                    .frame(width: 55, height: 55, alignment: .center)
                    .background(Color.systemBackground)
                    .font(.system(size: 35, weight: .heavy))
                    .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary, lineWidth: 2)
                            )
            }
            Spacer()
                .frame(width: 6)
            VStack (spacing: 3) {
                HStack (spacing: 3) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.correct)
                        .frame(width: 25, height: 25)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.misplaced)
                        .frame(width: 25, height: 25)
                }
                
                HStack (spacing: 3) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.misplaced)
                        .frame(width: 25, height: 25)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.wrong)
                        .frame(width: 25, height: 25)
                    
                }
            }
            
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(guess: .constant(Guess(index: 0)))
    }
}
