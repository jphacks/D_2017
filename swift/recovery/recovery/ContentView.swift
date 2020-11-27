//
//  ContentView.swift
//  recovery
//
//  Created by kanon on 2020/11/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var toUserMenuView = false
    
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20.0, height: 15.0)
                    TextField("Mail Address", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                }
                .padding()
                
                HStack{
                    Image(systemName: "key")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20.0, height: 15.0)
                    SecureField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
                .padding()
                
                Button(action: { self.toUserMenuView = true }){
                    Text("ログイン")
                        .fontWeight(.medium)
                        .frame(minWidth: 160)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                    NavigationLink(destination: UserMenuView(), isActive: $toUserMenuView) {
                       EmptyView()
                   }
                }
                Spacer()
                Text("登録がお済みでない方")
                Button(action: {}){
                    Text("アカウント登録はこちら")
                        .fontWeight(.medium)
                        .frame(minWidth: 160)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                }

            }
            .padding()
            .navigationTitle("ReCOVery LOGIN")
            .navigationBarBackButtonHidden(true)
        }
    }
                
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
