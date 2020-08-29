//
//  OnChangeDemo.swift
//
//  Created by LW on 29/8/20.
//

import SwiftUI

// 如何使用onChange watch @State或@Binding
// 如何初始化@State

struct OnChangeDemo: View {
    @State private var name = "DefaultValue"
    @State private var changedName = "here is the changed "
    
    init() {
        _changedName = _name
    }

        var body: some View {
            VStack {
                Text(changedName)
                TextField("Enter your name:", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: name) { newValue in
                        print("Name changed to \(name)!")
                        changedName = name
                    }
            }
        }
}

struct OnChangeDemo_Previews: PreviewProvider {
    static var previews: some View {
        OnChangeDemo()
    }
}
