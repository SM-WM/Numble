//
//  HelpView.swift
//  Numble
//
//  Created by Walter Mwaniki on 4/30/22.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text(
"""
Guess the **NUMBLE** in 10 tries.

Every numble is composed of 4 unique digits. Each guess will be a 4 digit number... Your solution's digits don't have to be unique. Hit the enter button to submit.

After each guess, the score column will let you know:

1. How many digits you got correct i.e. digit is in the numble and is placed in the right spot;

2. How many digits you misplaced i.e. digit is in the numble but is placed in the wrong spot;

3. How many digits you got wrong i.e. digit is not in the numble.

The catch:

You won't know which digits in your guess are correct, misplaced or wrong. As you'll see, getting all four digits wrong is one of the best things that can happen at the start.

Happy Guessing!
"""
                )
                .padding()
            }
            .navigationTitle("HOW TO PLAY")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
