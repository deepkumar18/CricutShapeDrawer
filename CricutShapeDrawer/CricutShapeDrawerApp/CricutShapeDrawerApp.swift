//
//  CricutShapeDrawerApp.swift
//  CricutShapeDrawer
//
//  Created by Deep kumar  on 5/19/25.
//

import SwiftUI

@main
struct CricutShapeDrawerApp: App {
    var body: some Scene {
        WindowGroup {
            ShapesGridView()
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
