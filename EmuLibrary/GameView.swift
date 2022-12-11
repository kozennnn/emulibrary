//
//  GameView.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 11/12/2022.
//

import Foundation

import SwiftUI

struct GameView: View {
    
    var game: Game
    
    var body: some View {
        game.image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 192, height: 256)
                        .cornerRadius(10.0)
                    
        /*HStack {
          // 2
          VStack(alignment: .leading, spacing: 30) {
            // 3
            Text("Flop")
              .font(.title)

            Text("Flop2")
              .font(.title3)

            // links go here
            
            // 4
            Spacer()
          }
          // 5
          Spacer()
        }
        // 6
        .padding()
        .frame(width: 250)*/
    }
    
}
