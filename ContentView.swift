//
//  ContentView.swift
//  MyProjectPerson
//
//  Created by Huy Pham Quang on 08/09/2023.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State var email = ""
    @State var password = ""
    @State var loginSuccess = false
    @State private var showingSignUpSheet = false
    
    var body : some View{
        VStack{
            Spacer()
            Group{
                TextField("Email", text : $email).textInputAutocapitalization(.never)
                SecureField("Password", text: $password)
            }
            Button {
                login()
            }label: {
                Text("Sign In").bold()
                    .frame(width: 360, height: 50)
                    .background(.thinMaterial)
                    .cornerRadius(10)
            }
            
            if loginSuccess{
                Text("Login Successfully!")
                    .foregroundColor(.green)
            }else{
                Text("Login fails!")
                    .foregroundColor(.red)
            }
            Spacer()
            
            Button{
                showingSignUpSheet.toggle()
            }label: {
                Text("Sign Up here")
            }
            
        }.padding(10)
        
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) {(result, error) in
            if error != nil{
                print(error? .localizedDescription ?? "")
                loginSuccess = false
            }
            else{
                print("Success")
                loginSuccess = true;
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
