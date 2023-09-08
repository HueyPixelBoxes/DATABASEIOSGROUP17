//
//  GameView.swift
//  MyProjectPerson
//
//  Created by Huy Pham Quang on 08/09/2023.
//

import SwiftUI

struct GameView: View {
    @State private var game : String = ""
    @State var returnLoginPage = false
    
    @StateObject private var gameViewMod = GameViewModel() // our view model created
    var body: some View {
        VStack{
            TextField("Enter game name: ", text: $game)
                .padding()
                .border(.black)
                .frame(width: 230, height: 40, alignment: .leading)
                .padding()
            Button {
                self.gameViewMod.addNewGameData(name: game)
            }label: {
                Text("Add Games")
                    .padding()
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
            }
            
            NavigationView{
                List {
                    ForEach(gameViewMod.games, id: \.id){ game in
                        Text(game.name ?? "")
                    }.onDelete(perform: removeGame)
                }.navigationTitle("All Game")
            }
            Button {
                returnLoginPage = true
            }label: {
                Text("Return to main page")
                    .padding()
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
            }
            
        }.sheet(isPresented: $returnLoginPage) {
            ContentView()
        }
    }
    func removeGame (at offsets: IndexSet){
        for index in offsets {
            if let documentID = gameViewMod.games[index].documentID{
                gameViewMod.removeGameData(documentID: documentID)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
