//
//  SidebarView.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 10/12/2022.
//

import SwiftUI

struct SidebarView: View {
    
    @State private var searchText = ""
    //@AppStorage("consoles") var consoless: [Any] = []
    
    /*let consoles: [Console] = [
        Console(id: UUID(), name: "Nintendo 64", brand: "Nintendo", image: Image("Nintendo64Icon")),
        Console(id: UUID(), name: "Gameboy Advance", brand: "Nintendo", image: Image("NintendoGBAIcon")),
        Console(id: UUID(), name: "DS", brand: "Nintendo", image: Image("NintendoDSIcon")),
        Console(id: UUID(), name: "3DS", brand: "Nintendo", image: Image("Nintendo3DSIcon")),
        Console(id: UUID(), name: "Wii U", brand: "Nintendo", image: Image("NintendoWiiUIcon")),
        Console(id: UUID(), name: "Switch", brand: "Nintendo", image: Image("NintendoSwitchIcon")),
        Console(id: UUID(), name: "Playstation", brand: "Playstation", image: Image("PlaystationPS1Icon")),
        Console(id: UUID(), name: "Playstation 2", brand: "Playstation", image: Image("PlaystationPS2Icon")),
        Console(id: UUID(), name: "Playstation 3", brand: "Playstation", image: Image("PlaystationPS3Icon")),
        Console(id: UUID(), name: "PSP", brand: "Playstation", image: Image("PlaystationPSPIcon")),
        Console(id: UUID(), name: "PSVita", brand: "Playstation", image: Image("PlaystationPSVitaIcon")),
    ]*/
    
    var body: some View {
        
        
        List() {
            NavigationStack {
                SearchField("Rechercher", height: 28, text: $searchText)

            }
            let consoles: [Console] = self.decode()
            var brands: [String] = Array(Set(consoles.map { $0.brand }))
            /*ForEach(consoles) { console in
                if !brands.contains(console.brand) {
                    brands.append(console.brand)
                }
            }*/
    
            
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
                            
                                    
                                        //Text(console.image)
                                        /*console.image
                                         .resizable()
                                         .frame(width: 24, height: 24)*/
                                    }
                                }
                            }
                    }.textCase(.uppercase)
                }
            }
            
            
            
            /*Button {
            } label: {
                Image(systemName: "plus")
              Text("Ajouter une console")
            }
            .buttonStyle(.bordered)
            .frame(maxWidth: .infinity, alignment: .bottom)*/
    
            
        }
        // 5
        .listStyle(.sidebar)
    }
    
    func decode() -> [Console] {
        /*let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)*/
        if let data: [Any] = UserDefaults.standard.array(forKey: "consoles") {
            do {
                // Create JSON Decoder
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
