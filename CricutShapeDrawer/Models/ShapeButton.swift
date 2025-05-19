//
//  ShapeButton.swift
//  CricutShapeDrawer
//
//  Created by Deep kumar  on 5/18/25.
//

import Foundation

struct ShapeButton: Codable, Identifiable {
    var id: UUID { UUID() }
    let name: String
    let draw_path: ShapeType
}

