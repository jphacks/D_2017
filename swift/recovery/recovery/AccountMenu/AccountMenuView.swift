//
//  AccountMenuView.swift
//  recovery
//
//  Created by kanon on 2020/11/28.
//

import SwiftUI

struct AccountMenuView: View {
    var body: some View {
        List{
            Section(header: Text("アカウント情報設定")){
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("検温デバイス設定")
                }
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("ICカード登録")
                }
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("ログアウト")
                }
            }
        }
        .navigationTitle(Text("アカウント情報設定"))
    }
}

struct AccountMenuView_Previews: PreviewProvider {
    static var previews: some View {
        AccountMenuView()
    }
}
