//
//  TempLogView.swift
//  recovery
//
//  Created by kanon on 2020/11/28.
//

import SwiftUI

struct TempLogView: View {
    var body: some View {
        List{
            Section(header: Text("機器別検温データ")){
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("User Device 1")
                }
            }
            Section(header: Text("体温手動登録")){
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("体温手動登録")
                }
            }
        }
        .navigationTitle(Text("検温ログ"))
    }
}

struct TempLogView_Previews: PreviewProvider {
    static var previews: some View {
        TempLogView()
    }
}
