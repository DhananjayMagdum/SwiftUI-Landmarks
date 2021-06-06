//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Dhananjay Magdum on 23/05/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModeleData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
