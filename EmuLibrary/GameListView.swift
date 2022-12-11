//
//  GameView.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 11/12/2022.
//

import Foundation

import SwiftUI

struct GameListView: View {
    
    @State private var searchText = ""
    
    var games: [Game] = [Game(id: UUID(), name: "Animal Crossing: New Horizon", image: Image("ACNH")), Game(id: UUID(), name: "Wii Sport Resort", image: Image("WiiSportResort")),
                         Game(id: UUID(), name: "Animal Crossing: New Horizon", image: Image("ACNH")),
                         Game(id: UUID(), name: "Animal Crossing: New Horizon", image: Image("ACNH")),
                         Game(id: UUID(), name: "Animal Crossing: New Horizon", image: Image("ACNH")),
                         Game(id: UUID(), name: "Animal Crossing: New Horizon", image: Image("ACNH")),
                         Game(id: UUID(), name: "Animal Crossing: New Horizon", image: Image("ACNH")),
                         Game(id: UUID(), name: "Animal Crossing: New Horizon", image: Image("ACNH")),
                         Game(id: UUID(), name: "Animal Crossing: New Horizon", image: Image("ACNH")),
                         Game(id: UUID(), name: "Animal Crossing: New Horizon", image: Image("ACNH"))]

    // 2
    var columns: [GridItem] {
      [GridItem(.adaptive(minimum: 192, maximum: 192), spacing: 16)]
    }
    @State var showSearch: Bool = false;
    
    var body: some View {
        
        HStack(alignment: .lastTextBaseline) {
            
            if showSearch {
                HStack {
                    SearchField("Rechercher un jeu", height: 28, text: $searchText)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
  



            HStack {
                Button {
                    showSearch = !showSearch
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 16, height: 16)
                }.frame(width: 24, height: 24)
                    .buttonStyle(PlainButtonStyle())
                Button {
       
                } label: {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 16, height: 16)
                }.frame(width: 24, height: 24)
                    .buttonStyle(PlainButtonStyle())
                Button {} label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 16, height: 16)
                }.frame(width: 24, height: 24)
                    .buttonStyle(PlainButtonStyle())
            }.frame(maxWidth: .infinity, alignment: .trailing)
            
        }
        .padding(16)
        .offset(y: -28)
        .padding(.bottom, 0)
        
        ScrollView {

          LazyVGrid(columns: columns, spacing: 16) {
        
              ForEach(games) { game in
                  GameView(game: game)
            }
          }.padding(16)
                .offset(y: -16)
            
        }.offset(y: -34)
    }
    
}
