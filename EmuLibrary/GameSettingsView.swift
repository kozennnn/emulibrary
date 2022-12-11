//
//  ConsoleSettingsView.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 11/12/2022.
//

import SwiftUI
import Preferences

struct GameSettingsView: View {
    private let contentWidth: Double = 450.0
    
    var body: some View {
        Preferences.Container(contentWidth: contentWidth) {
            Preferences.Section(title: "Database") {
                Preferences.Section(title: "") {
                    Button(action: {  }, label: {
                        Text("Delete all notes")
                    })
                    Text("This will delete all notes, even the ones synced with iCloud.")
                        .preferenceDescription()
                }
            }
        }
    }
}
