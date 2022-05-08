//
//  SettingsView.swift
//  Numble
//
//  Created by Walter Mwaniki on 5/1/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    Text("All the settings")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    .navigationViewStyle(.stack)
                        .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Settings")
                                .font(.system(size: 30.0, weight: .thin, design: .monospaced))
                                .foregroundColor(.primary)
                        }
                        
                    }
                }
            }
            .padding(20)
        }        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
