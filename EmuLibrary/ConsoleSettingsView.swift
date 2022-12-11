//
//  ConsoleSettingsView.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 11/12/2022.
//

import SwiftUI
import Preferences

struct ConsoleSettingsView: View {
    
    @State private var searchText = ""
    @State private var showCreatePane = false
    @State private var selection: Console?
    
    //@Binding private let consoles: [[String: String]]
    
    private let contentWidth: Double = 450.0
    
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
        Preferences.Container(contentWidth: contentWidth) {
            Preferences.Section(title: "Liste des consoles") {
                //let consoles = self.decode()
                let consoles = self.decode()
                
            
                HStack {
                    VStack {
                        HStack {
                            SearchField("Rechercher une console", height: 28, text: $searchText)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        NavigationStack {
                                    List(consoles, id: \.self, selection: $selection) { console in
                                        Text(console.name)
                                    }
                                    .navigationTitle("List Selection")
                                    .toolbar {
                                        Button(action: {
                                            
                                        }, label: {
                                            Text("Supprimer")
                                        })
                                        Button(action: {
                                            
                                        }, label: {
                                            Text("Modifier")
                                        })
                                    }
                        }.frame(height: 200)
                    }
                    .padding()

                    VStack {
                        if showCreatePane && selection == nil {
                            ConsoleFormView()
                            HStack {
                                Button(action: {
                                    showCreatePane = false
                                }, label: {
                                    Text("Annuler")
                                })
                        
                            }
                        } else if selection == nil {
                            Image(systemName: "gamecontroller")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Aucune console sélectionnée")
                        } else {
                            Button(action: {
                                
                            }, label: {
                                Text("Supprimer")
                            })
                        }
                 
                    }
                    .padding()
                }
                // 3
                .frame(
                    width: .infinity)
                Preferences.Section(title: "") {
                    Button(action: {
                        showCreatePane = true
                        selection = nil
                    }, label: {
                        Text("Ajouter une console")
                    })
                }
            }
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
    
    func decode() -> [Console] {
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

