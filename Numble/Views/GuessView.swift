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
        VStack {
            HStack(spacing: 8) {
                ForEach(0...3, id: \.self) { index in
                    Text(guess.numArr[index])
                        .foregroundColor(.primary)
                        .frame(width: 60, height: 60, alignment: .center)
                        .background(Color.systemBackground)
                        .font(.system(size: 35, weight: .heavy))
                        .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 2)
                                )
                }
                
                Spacer()
                    .frame(width: 6)
                
                VStack (spacing: 6) {
                    HStack (spacing: 6) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary, lineWidth: 2)
                                .frame(width: 28, height: 28)
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.correct)
                            .frame(width: 28, height: 28)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary, lineWidth: 2)
                                .frame(width: 28, height: 28)
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.misplaced)
                            .frame(width: 28, height: 28)
                        }
                    }
                    
                    HStack (spacing: 6) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary, lineWidth: 2)
                                .frame(width: 28, height: 28)
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.misplaced)
                            .frame(width: 28, height: 28)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary, lineWidth: 2)
                                .frame(width: 28, height: 28)
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.wrong)
                            .frame(width: 28, height: 28)
                        }
                        
                    }
                }
                
            }
//            Divider().frame(width: 355,height: 0.5).background(Color.primary)
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(guess: .constant(Guess(index: 0)))
    }
}
