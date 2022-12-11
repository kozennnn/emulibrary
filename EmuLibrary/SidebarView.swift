//
//  SidebarView.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 10/12/2022.
//

import SwiftUI

struct SidebarView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        List() {
            NavigationStack {
                SearchField("Rechercher", height: 28, text: $searchText)
                
            }
            let consoles: [Console] = self.decode()
            var brands: [String] = Array(Set(consoles.map { $0.brand }))
            
            if searchText != "" {
                ForEach(consoles.filter({ (console: Console) -> Bool in
                    return console.name.range(of: searchText, options: .caseInsensitive) != nil }), id: \.self) { console in
                        NavigationLink(destination: ContentView()) {
                            Label {
                                Text(console.name)
                            } icon: {
                                if let nsImage = NSImage(contentsOfFile: console.image.path) {
                                    Image(nsImage: nsImage)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                }
                            }
                        }
                    }
            } else {
                ForEach(brands, id: \.self) { brand in
                    Section(brand) {
                        ForEach(consoles.filter({ (console: Console) -> Bool in
                            return console.brand == brand })) { console in
                                NavigationLink(destination: GameListView()) {
                                    Label {
                                        Text(console.name).textCase(.none)
                                    } icon: {
                                        if let nsImage = NSImage(contentsOfFile: console.image.path) {
                                            Image(nsImage: nsImage)
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                        }
                                    }
                                }
                            }
                    }.textCase(.uppercase)
                }
            }
        }
        .listStyle(.sidebar)
    }
    
    func decode() -> [Console] {
        /*let domain = Bundle.main.bundleIdentifier!
         UserDefaults.standard.removePersistentDomain(forName: domain)
         UserDefaults.standard.synchronize()
         print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)*/
        if let data: [Any] = UserDefaults.standard.array(forKey: "consoles") {
            do {
                let decoder = JSONDecoder()
                var decodedArray: [Console] = []
                for datum in data {
                    let console = try decoder.decode(Console.self, from: datum as! Data)
                    decodedArray.append(console)
                }
                return decodedArray
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        return []
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
