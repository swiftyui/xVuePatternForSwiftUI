//
//  WatchPattern.swift
//  xVueJSPatternForiOS
//
//  Created by LW on 29/8/20.
//

import SwiftUI

struct WatchPattern: View {
    
    var body: some View {
        List {
            NavigationLink("Comphrensive solution to watch @Bindg @State Store/Computed Property)", destination: OnChangeWatchPattern())
            NavigationLink("Via ObserableState for @State only", destination: ObserableStateWatchPattern())
            NavigationLink("Via willSet/didSet for computed property only", destination: ObserableStateWatchPattern())
        }
    }
}
