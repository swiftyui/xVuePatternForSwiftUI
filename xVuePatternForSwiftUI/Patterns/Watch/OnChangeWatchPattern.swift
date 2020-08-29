//
//  OnChangeWatchPattern.swift
//  xVueJSPatternForiOS
//
//  Created by LW on 29/8/20.
//

import SwiftUI

struct OnChangeWatchPattern: View {
    @State private var name: String = "Json"
    @State private var selected: Bool = false
    @State private var count = 0
    
    var body: some View {
        VStack(alignment:.leading) {
            Text("Please check console output")
                .padding(.bottom, 30)
            Button("Click to change Store Property") {
                count += 1
                self.name = "\(name)\(count)"
            }
            WatchPatternDetails(name: name, selected: $selected)
        }.padding()
        .navigationTitle("Reimplement iOS 14 onChange")
    }
}

struct WatchPatternDetails: View {
    
    var name: String = "Json"
    
    @State private var address: String = "Australia"
    
    @Binding var selected: Bool
    
    @State private var count = 0
    
    var body: some View {
        VStack(alignment:.leading) {
            Toggle("Click to toggle @Binding", isOn: $selected)
            Button("Click to change @State") {
                count += 1
                self.address = "\(address)\(count)"
            }
        }.onChange(of: name) { (oldValue, newValue) in
            print(oldValue ?? "NA", newValue)
        }.onChange(of: address) { (oldValue, newValue) in
            print(oldValue ?? "NA", newValue)
        }.onChange(of: selected) { (oldValue, newValue) in
            print(oldValue ?? "NA", newValue)
        }
    }
}
