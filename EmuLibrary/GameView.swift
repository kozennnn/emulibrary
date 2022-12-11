//
//  GameView.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 11/12/2022.
//

import SwiftUI

struct GameView: View {
    
    var game: Game
    
    var body: some View {
        game.image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 192, height: 256)
            .cornerRadius(10.0)
    }
    
}
