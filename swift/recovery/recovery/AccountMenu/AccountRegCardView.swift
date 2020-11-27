//
//  AccountRegCardView.swift
//  recovery
//
//  Created by kanon on 2020/11/28.
//

import SwiftUI

struct AccountRegCardView: View {
    var body: some View {
        VStack{
            Text("カードをスマートフォンの上部に覆い隠すように置いてから、下の「スキャン」ボタンを押してください。\n【エラーが表示される場合】\n ・スキャンがうまくいかない場合は、ケースやカバーを外してください。")
                .padding()
            
            Button(action: {}){
                Text("スキャン")
                    .fontWeight(.medium)
                    .frame(minWidth: 160)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            Spacer()
            .navigationTitle(Text("ICカード登録"))
        }
    }
}

struct AccountRegCardView_Previews: PreviewProvider {
    static var previews: some View {
        AccountRegCardView()
    }
}
