//
//  MemoryGameByKarthikApp.swift
//  MemoryGameByKarthik
//
//  Created by Codigo Technologies on 18/01/26.
//

import SwiftUI

@main
struct MemoryGameByKarthikApp: App {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var navModel = NavigationModel()
    var body: some Scene {
        WindowGroup {
            GameBoardConfigView()
                .environmentObject(navModel)
        }
    }
}
