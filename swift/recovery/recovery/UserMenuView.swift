//
//  UserMenuView.swift
//  recovery
//
//  Created by kanon on 2020/11/27.
//

import SwiftUI

struct UserMenuView: View {
    var body: some View {
        List{
            Section(header: Text("ユーザメニュー")){
                NavigationLink(destination: EnterRoomListView()) {
                    Text("入室申請一覧")
                }
                NavigationLink(destination: TempLogView()) {
                    Text("検温ログ")
                }
                NavigationLink(destination: AccountMenuView()) {
                    Text("アカウント情報設定")
                }
            }
            Section(header: Text("管理者メニュー")){
                NavigationLink(destination: RoomAdminMenuView()) {
                    Text("部屋管理メニュー")
                }
            }
        }
        .navigationTitle(Text("メニュー"))
        .navigationBarBackButtonHidden(true)
    }
}

struct UserMenuView_Previews: PreviewProvider {
    static var previews: some View {
        UserMenuView()
    }
}
