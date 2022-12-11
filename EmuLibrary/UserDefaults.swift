//
//  UserDefaults.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 11/12/2022.
//

import Foundation

extension UserDefaults {

    enum Keys: String, CaseIterable {

        case unitsNotation
        case temperatureNotation
        case allowDownloadsOverCellular

    }

    func reset() {
        Keys.allCases.forEach { removeObject(forKey: $0.rawValue) }
    }

}
