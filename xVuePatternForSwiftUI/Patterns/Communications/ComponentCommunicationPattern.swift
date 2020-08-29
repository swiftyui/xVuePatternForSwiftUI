//
//  ComponentCommunicationPattern.swift
//  xVuePatternForSwiftUI
//
//  Created by LW on 29/8/20.
//

import SwiftUI

struct ComponentCommunicationPattern: View {
    var body: some View {
        Text("Check out https://www.vadimbulavin.com/passing-data-between-swiftui-views/")
            .font(.system(size: 14)).padding()
        List {
            NavigationLink("From parent to direct child – use an initializer.", destination: EmptyView())
            NavigationLink("From parent to distant child – use @Environment.", destination: EmptyView())
            NavigationLink("From child to direct parent – use @Binding and callbacks.", destination: EmptyView())
            NavigationLink("From child to distant parent – use PreferenceKey.", destination: EmptyView())
            NavigationLink("Between Children – Lift the State Up", destination: EmptyView())
            NavigationLink("Context - use EnvironmentObject",destination: EmptyView())
        }
    }
}

struct ComponentCommunicationPattern_Previews: PreviewProvider {
    static var previews: some View {
        ComponentCommunicationPattern()
    }
}
