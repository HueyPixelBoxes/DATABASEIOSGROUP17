//
//  signUpView.swift
//  MyProjectPerson
//
//  Created by Huy Pham Quang on 08/09/2023.
//

import SwiftUI
import Firebase

struct signUpView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var email = ""
    @State var password = ""
    @State var passwordConfirm = ""
    @State var signUpSuccess = false
    
    var body: some View {
        VStack {
               Spacer()
            Group{
                TextField("Email", text : $email)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $password)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                SecureField("Confirm Password", text: $passwordConfirm)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                    .border(Color.red, width: passwordConfirm != password ? 1 : 0)
                    .padding(.bottom, 30)
            }
            
            Button(action : {
                signUp()
            }){
                Text("Sign up")
                    .bold()
                    .frame(width: 260, height: 50)
                    .background(.thinMaterial)
                    .cornerRadius(10)
            }
            
            if signUpSuccess{
                Text("SIGN UP SUCCESSFUL!")
                    .foregroundColor(.green)
            }else{
                Text("SIGN UP FAIL!")
                    .foregroundColor(.red)
            }
            
            Spacer()
            
            Button{
                dismiss()
            }label : {
               Text("Back to Sign In page")
            }
            Spacer()
        }.padding(15)
            .sheet(isPresented: $signUpSuccess) {
                ContentView()
            }
    }
    func signUp (){
        Auth.auth().createUser(withEmail: email, password: password){authResult, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                signUpSuccess = false
            }else{
                signUpSuccess = true
            }
        }
    }
}

struct signUpView_Previews: PreviewProvider {
    static var previews: some View {
        signUpView()
    }
}
