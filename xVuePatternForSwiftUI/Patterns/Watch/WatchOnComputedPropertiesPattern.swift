//
//  WatchOnComputedPropertiesPattern.swift
//
//  Created by LW on 29/8/20.
//

import SwiftUI

struct ToggleModel {
    
    //Computed property
    var isWifiOpen: Bool = true {
        willSet {
            print("wifi status will change")
        }
    }
}

struct WatchOnComputedPropertiesPattern: View {
    @State var model = ToggleModel()

    var body: some View {
        Toggle(isOn: $model.isWifiOpen) {
            HStack {
                Image(systemName: "wifi")
                Text("wifi")
            }
       }.accentColor(.pink)
       .padding()
        .navigationTitle("Via willSet/didSet")
   }
}


struct WatchOnComputedPropertiesPattern_Previews: PreviewProvider {
    static var previews: some View {
        WatchOnComputedPropertiesPattern()
    }
}
