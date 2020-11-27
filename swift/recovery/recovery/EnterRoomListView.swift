//
//  EnterRoomListView.swift
//  recovery
//
//  Created by kanon on 2020/11/27.
//

import SwiftUI

struct EnterRoomListView: View {
    var body: some View {
        VStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
                    .padding()
            }
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
            }.padding()
        }
    }
}

struct EnterRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        EnterRoomListView()
    }
}
