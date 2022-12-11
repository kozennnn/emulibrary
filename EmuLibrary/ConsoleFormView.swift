//
//  ConsoleFormView.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 11/12/2022.
//

import SwiftUI
import PhotosUI
import AppKit

struct ConsoleFormView: View {
    
    @State private var name = ""
    @State private var brand = ""
    @State private var icon: URL?
    @State private var showFileImporter = false
    
    var body: some View {
        VStack {
            TextField(
                    "Console name",
                    text: $name
                )
            TextField(
                    "Console brand",
                    text: $brand
                )
            if (icon != nil) {
                Image(nsImage: NSImage(contentsOfFile: icon!.path)!)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            Text(icon?.path ?? "flop")
            Button(action: {
                showFileImporter = true
            }, label: {
                Text("Sélectionner une icone")
            })
            Button(action: {
                /*let console = Console(id: UUID(),
                                      name: name,
                                      brand: brand,
                                      image: Image(nsImage: NSImage(contentsOfFile: icon!.path)!))*/
                self.save()
                
            }, label: {
                Text("Ajouter")
            }).disabled(name == "" || icon == nil)
        }.fileImporter(isPresented: $showFileImporter, allowedContentTypes: [.png]) { (res) in
            do {
                
                icon = try res.get()
            } catch {
                
                print("error reading docs")

                print(error.localizedDescription)

                }

            
        }

    }
    
    func save() {
        do {
            let console = Console(id: UUID(),
                                  name: name,
                                  brand: brand,
                                  image: icon!)
            let encoder = JSONEncoder()
            
            
            let data = try encoder.encode(console)
            var consoles = UserDefaults.standard.array(forKey: "consoles") ?? []
            consoles.append(data)
            UserDefaults.standard.set(consoles, forKey: "consoles")
            
        } catch {}
    }
}

struct ConsoleFormView_Previews: PreviewProvider {
    static var previews: some View {
        ConsoleFormView()
    }
}
