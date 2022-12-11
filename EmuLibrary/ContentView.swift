//
//  ContentView.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 10/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SidebarView()
            
            VStack {
                Image(systemName: "gamecontroller")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Sélectionnez une console")
            }
            .padding()
        }
        .frame(
            minWidth: 700,
            idealWidth: 1000,
            maxWidth: .infinity,
            minHeight: 400,
            idealHeight: 800,
            maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
