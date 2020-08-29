//
//  LifeCyclePattern.swift
//  xVuePatternForSwiftUI
//
//  Created by LW on 29/8/20.
//

import SwiftUI

struct LifeCyclePattern: View {
    @State private var count: Int = 0
    var body: some View {
        VStack {
            Text("SwiftUI only has init/onAppear/onDisappear life cycle and you can set @State @Binding there ")
                .padding(.bottom, 30)
            Text("Demo here: Count is set to 200 after onAppear")
                .onAppear(perform: {
                    self.count = 100
                })
            Spacer()
        }
    }
}

struct LifeCyclePattern_Previews: PreviewProvider {
    static var previews: some View {
        LifeCyclePattern()
    }
}
