//
//  AddRoomView.swift
//  recovery
//
//  Created by kanon on 2020/11/28.
//

import SwiftUI

struct AddRoomView: View {
    var body: some View {
        VStack {
            HStack{
                TextField("部屋名", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            HStack{
                TextField("体温上限", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/){
                Button(action: {}){
                    Text("次へ")
                        .fontWeight(.medium)
                        .frame(minWidth: 160)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                }
            }

        }
        .padding()
        .navigationTitle("新規部屋追加")
    }
}

struct AddRoomView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoomView()
    }
}
