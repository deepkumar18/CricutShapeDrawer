//
//  MockShapeService.swift
//  CricutShapeDrawerTests
//
//  Created by Deep kumar  on 5/19/25.
//

import Foundation
@testable import CricutShapeDrawer
class MockShapeService: ShapeService {
    override func fetchShapeButtons() async throws -> [ShapeButton] {
        return [
            ShapeButton(name: "Mock Circle", draw_path: .circle),
            ShapeButton(name: "Mock Square", draw_path: .square)
        ]
    }
}
