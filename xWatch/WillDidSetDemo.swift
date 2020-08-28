//
//  WillDidSetDemo.swift
//
//  Created by LW on 29/8/20.
//

import SwiftUI

struct ToggleModel {
    var isWifiOpen: Bool = true {
        willSet {
            print("wifi status will change")
        }
    }
}

struct WillDidSetDemo: View {
    @State var model = ToggleModel()

    var body: some View {
        Toggle(isOn: $model.isWifiOpen) {
            HStack {
                Image(systemName: "wifi")
                Text("wifi")
            }
       }.accentColor(.pink)
       .padding()
   }
}


struct WillDidSetDemo_Previews: PreviewProvider {
    static var previews: some View {
        WillDidSetDemo()
    }
}
