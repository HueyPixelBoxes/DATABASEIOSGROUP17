//
//  GameViewModel.swift
//  MyProjectPerson
//
//  Created by Huy Pham Quang on 08/09/2023.
//

import Foundation
import FirebaseFirestore

class GameViewModel :  ObservableObject{
    @Published var games = [Game]()
    private var database = Firestore.firestore()
    
    init(){
        getAllGameData()
    }
    func getAllGameData(){
        //get "game" document from database
        database.collection("game").addSnapshotListener {(QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("NO DODUMENT")
                return
            }
            //loop inside to get all name in game document
            self.games = documents.map{ (QueryDocumentSnapshot) -> Game in
                let data = QueryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                return Game(name: name, documentID: QueryDocumentSnapshot.documentID)
                
            }
        }
        
    }
    
    func addNewGameData(name : String){
        // add new document of game
        database.collection("game").addDocument(data: ["name": name])
    }
    
    func removeGameData (documentID: String){
        database.collection("game").document(documentID).delete{ (error) in
            if let error = error {
                print("Error removing document: \(error)")
            }else{
                print("Document successfully removed")
            }
        }
    }
}
