//
//  ObserableStateWatchPattern.swift
//  xVueJSPatternForiOS
//
//  Created by LW on 29/8/20.
//

import SwiftUI
import Combine
import SwiftUIX

struct ObserableStateWatchPattern: View {
    @ObservableState var foo: Int = 0

    let observation: AnyCancellable?

    init() {
        observation = _foo.willChange.sink {
            print($0.oldValue, $0.newValue)
        }
    }

    var body: some View {
        VStack {
            Text("Can only watch @State").padding(.bottom, 30)
            Text("Count: \(foo)")
            Button(action: { self.foo += 1 }) {
                Text("Increment")
            }
        }.navigationTitle("Via @ObservableState")
    }
}
