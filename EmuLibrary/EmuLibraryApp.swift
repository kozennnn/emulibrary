//
//  EmuLibraryApp.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 10/12/2022.
//

import SwiftUI
import Preferences

@main
struct EmuLibraryApp: App {
  

        public let GeneralPreferenceViewController: () -> PreferencePane = {
            let paneView = Preferences.Pane(
                identifier: .general,
                title: "General",
                toolbarIcon: NSImage(systemSymbolName: "gearshape", accessibilityDescription: "General preferences")!
            ) {
                GeneralSettingsView()
            }

            return Preferences.PaneHostingController(pane: paneView)
        }
        
        let ConsolePreferenceViewController: () -> PreferencePane = {
            let paneView = Preferences.Pane(
                identifier: .console,
                title: "Console",
                toolbarIcon: NSImage(systemSymbolName: "externaldrive.connected.to.line.below", accessibilityDescription: "Console management")!
            ) {
                ConsoleSettingsView()
            }

            return Preferences.PaneHostingController(pane: paneView)
        }
    
    let GamePreferenceViewController: () -> PreferencePane = {
        let paneView = Preferences.Pane(
            identifier: .game,
            title: "Game",
            toolbarIcon: NSImage(systemSymbolName: "gamecontroller", accessibilityDescription: "Game management")!
        ) {
            GameSettingsView()
        }

        return Preferences.PaneHostingController(pane: paneView)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(HiddenTitleBarWindowStyle())
            .commands {
                CommandGroup(replacing: CommandGroupPlacement.appSettings) {
                    Button("Preferences...") {
                        PreferencesWindowController(
                            preferencePanes: [GeneralPreferenceViewController(), ConsolePreferenceViewController(),
                                              GamePreferenceViewController()],
                            style: .toolbarItems,
                            animated: true,
                            hidesToolbarForSingleItem: true
                        ).show()
                    }.keyboardShortcut(KeyEquivalent(","), modifiers: .command)
                }
            }
    }
}
