//
//  ObservableObjectDemo.swift
//
//  Created by LW on 29/8/20.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
    @Published var value1 = 0
    
    //如果不用 @Published，则用objectWillChange.send
    var value2: Int = 0 {
        willSet {
            objectWillChange.send()
        }
    }

    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value1 += 1
                self.value2 += 1
            }
        }
    }
}

struct ObservableObjectDemo: View {
    @ObservedObject var updater = DelayedUpdater()

        var body: some View {
            VStack {
                Text("Value1 is: \(updater.value1)")
                Text("Value1=2 is: \(updater.value2)")
            }.onReceive(updater.$value1, perform: { value in
                print(value)
            })
        }
}

struct ObservableObjectDemo_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectDemo()
    }
}
