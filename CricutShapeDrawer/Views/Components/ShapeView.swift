//
//  ShapeView.swift
//  CricutShapeDrawer
//
//  Created by Deep kumar  on 5/18/25.
//

import Foundation
import SwiftUI

struct ShapeView: View {
    let type: ShapeType

    var body: some View {
        switch type {
        case .circle:
            Circle()
                .fill(Color.cyan)
                .frame(width: 60, height: 60)
        case .square:
            Rectangle()
                .fill(Color.cyan)
                .frame(width: 60, height: 60)
        case .triangle:
            Triangle()
                .fill(Color.cyan)
                .frame(width: 60, height: 60)
        }
    }
}
