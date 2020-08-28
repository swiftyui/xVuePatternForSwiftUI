//
//  CustomBindingDemo.swift
//
//  Created by LW on 29/8/20.
//

import SwiftUI

struct CustomBindingDemo: View {
    @State private var query = ""

        var body: some View {

            let binding = Binding<String>(
                get: { self.query },
                set: { self.query = $0; self.textFieldChanged($0) }
            )

            return  List {
                TextField("Text", text: binding)
            }
        }

        private func textFieldChanged(_ text: String) { print(text) }
}

struct CustomBindingDemo_Previews: PreviewProvider {
    static var previews: some View {
        CustomBindingDemo()
    }
}
