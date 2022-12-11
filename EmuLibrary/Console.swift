//
//  Console.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 10/12/2022.
//

import SwiftUI

struct Console: Identifiable, CaseIterable, Hashable, Codable {
    static var allCases: [Console] = []
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
    
    let id: UUID
    let name: String
    let brand: String
    let image: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case brand
        case image
    }
    
    init(id: UUID, name: String, brand: String, image: URL) {
        self.id = id
        self.name = name
        self.brand = brand
        self.image = image
    }
    
    init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        brand = try values.decode(String.self, forKey: .brand)
        image = try values.decode(URL.self, forKey: .image)
    }
}
