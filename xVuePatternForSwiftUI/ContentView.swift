//
//  ContentView.swift
//
//  Created by LW on 29/8/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isSelected: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Watch on @State @Binding Store/Computed Property", destination: WatchPattern())
                NavigationLink("View Communication", destination: ComponentCommunicationPattern())
                NavigationLink("Vue.js data == SwiftUI @State", destination: EmptyView())
                NavigationLink("Vue.js vs SwiftUI Life Cycle", destination: LifeCyclePattern())
                NavigationLink("Vuex on SwiftUI, checkout https://github.com/swiftyui/xHome", destination: EmptyView())
                NavigationLink("Vue.js useContext == SwiftUI EnvironmentObject", destination: ObservableObjectDemo())
                NavigationLink("SwiftUI Special Pattern", destination:  SwiftUISpecialPattern())

            }.navigationBarTitle("Vue.js Pattern on SwiftUI", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
