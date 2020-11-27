//
//  AccountRegTempDeviceView.swift
//  recovery
//
//  Created by kanon on 2020/11/28.
//

import SwiftUI

struct AccountRegTempDeviceView: View {
    var body: some View {
        Text("下に表示されるリストの中から、登録するデバイスを選択してください。\n表示されない場合は、以下の2点をご確認ください。\n ・機器の電源が入っているか\n ・スマートフォンと機器を近づけているか")
            .padding()
        List{
            Section(header: Text("検出した検温デバイス一覧")){
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("Device Name 1")
                }
            }
        }
        .navigationTitle(Text("検温デバイス設定"))
    }
}

struct AccountRegTempDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        AccountRegTempDeviceView()
    }
}
