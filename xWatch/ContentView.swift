//
//  ContentView.swift
//
//  Created by LW on 29/8/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("SwiftUI2.0 onChange on @State/@Binding", destination: OnChangeDemo())
                NavigationLink("Combine onReceive on ObservableObject", destination: ObservableObjectDemo())
                NavigationLink("Custom ObservableState", destination: ObservableStateDemo())
                NavigationLink("Binding variables(set/get)", destination: CustomBindingDemo())
                NavigationLink("Traditional willSet/didSet", destination: WillDidSetDemo())
                NavigationLink("KVO, not recommended", destination: EmptyView())
                NavigationLink("NotificationCenter, not recommended", destination: EmptyView())
                NavigationLink("Target/Action, not recommended", destination: EmptyView())
            }.navigationTitle("Kinds of watch")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
