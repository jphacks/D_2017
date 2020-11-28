//
//  RoomAdminMenuView.swift
//  recovery
//
//  Created by kanon on 2020/11/28.
//

import SwiftUI

struct RoomAdminMenuView: View {
    var body: some View {
        List{
            Section{
                NavigationLink(destination: AddRoomView()) {
                    Text("新規部屋追加")
                }
            }
            Section(header: Text("管理部屋一覧")){
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("Room 1")
                }
            }
        }
        .navigationTitle(Text("部屋管理メニュー"))
    }
}

struct RoomAdminMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RoomAdminMenuView()
    }
}
