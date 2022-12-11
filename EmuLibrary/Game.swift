//
//  Console.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 10/12/2022.
//

import SwiftUI

struct Game: Identifiable, CaseIterable, Hashable {
    static var allCases: [Game] = []
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
    
    let id: UUID
    let name: String
    let image: Image
}
