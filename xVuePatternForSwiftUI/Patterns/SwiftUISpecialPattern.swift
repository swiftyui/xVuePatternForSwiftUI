//
//  SwiftUISpecialPattern.swift
//  xVueJSPatternForiOS
//
//  Created by LW on 29/8/20.
//

import SwiftUI

struct SwiftUISpecialPattern: View {
    var body: some View {
        List {
            NavigationLink("Binding", destination:  CustomBindingDemo())
            NavigationLink("NOT recommended to use traditional KVO/NotificationCenter/Target-Action any more", destination: EmptyView())

        }.navigationBarTitle("SwiftUI Special Pattern", displayMode: .inline)
    }
}

struct SwiftUISpecialPattern_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISpecialPattern()
    }
}
