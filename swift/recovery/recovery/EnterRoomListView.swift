//
//  EnterRoomListView.swift
//  recovery
//
//  Created by kanon on 2020/11/27.
//

import SwiftUI

struct EnterRoomListView: View {
    var body: some View {
        List{
            Section(header: Text("承認済み申請一覧")){
                Text("Room 1")
            }
            Section(header: Text("未承認申請一覧")){
                Text("Room 4")
            }
        }
        .navigationTitle(Text("申請一覧"))
    }
}

struct EnterRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        EnterRoomListView()
    }
}
