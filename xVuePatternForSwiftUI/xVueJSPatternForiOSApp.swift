//
//  xWatchApp.swift
//
//  Created by LW on 29/8/20.
//

import SwiftUI

@main
struct xVueJSPatternForiOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DelayedUpdater())
        }
    }
}
