//
//  TempAddRequestView.swift
//  recovery
//
//  Created by kanon on 2020/11/28.
//

import SwiftUI

struct TempAddRequestView: View {
    var body: some View {
        VStack {
            TextField("現在の体温を入力", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Button(action: {}){
                Text("登録")
                    .fontWeight(.medium)
                    .frame(minWidth: 160)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("体温手動登録")
    }
}

struct TempAddRequestView_Previews: PreviewProvider {
    static var previews: some View {
        TempAddRequestView()
    }
}
