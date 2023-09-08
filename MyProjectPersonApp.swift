//
//  MyProjectPersonApp.swift
//  MyProjectPerson
//
//  Created by Huy Pham Quang on 08/09/2023.
//

import SwiftUI
import Firebase

@main
struct MyProjectPersonApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
