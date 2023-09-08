//
//  Game.swift
//  MyProjectPerson
//
//  Created by Huy Pham Quang on 08/09/2023.
//

import Foundation
struct Game: Codable, Identifiable{
    var id: String = UUID().uuidString
    var name : String?
    var documentID : String?
}
