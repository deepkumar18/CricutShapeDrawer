//
//  ShapesViewModel.swift
//  CricutShapeDrawer
//
//  Created by Deep kumar  on 5/18/25.
//

import Foundation
import SwiftUI

class ShapesViewModel: ObservableObject {
    
    /// Available dynamic shape buttons fetched from the API
    @Published var shapeButtons: [ShapeButton] = []
    
    /// All drawn shapes in order (circle, square, triangle as string)
    @Published var shapes: [ShapeType] = []

    /// Filters only circles from shapes
    var circles: [ShapeType] {
        shapes.filter { $0 == .circle }
    }

    private let shapeService: ShapeService

    init(shapeService: ShapeService = ShapeService()) {
        self.shapeService = shapeService
    }

    /// Fetches dynamic shape buttons from Cricut's remote JSON
    func fetchButtons() async {
        do {
            let buttons = try await shapeService.fetchShapeButtons()
            DispatchQueue.main.async {
                self.shapeButtons = buttons
            }
            
        } catch {
            print("❌ Error fetching buttons: \(error)")
        }
    }

    /// Adds a shape type (e.g., "circle", "square") to the grid
    func addShape(_ type: ShapeType) {
        shapes.append(type)
    }
    
    func clearAll() {
        shapes.removeAll()
    }

    func deleteAllCircles() {
        shapes.removeAll { $0 == ShapeType.circle }
    }

    func addCircle() {
        addShape(ShapeType.circle)
    }
    
    /// Removes the most recently added circle from the grid
    func removeLastCircle() {
        if let lastIndex = shapes.lastIndex(of: ShapeType.circle) {
            shapes.remove(at: lastIndex)
        }
    }
}
