//
//  CricutShapeDrawerTests.swift
//  CricutShapeDrawerTests
//
//  Created by Deep kumar  on 5/19/25.
//

import XCTest
@testable import CricutShapeDrawer

final class CricutShapeDrawerTests: XCTestCase {

    var viewModel: ShapesViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ShapesViewModel(shapeService: MockShapeService())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testAddShape() {
        XCTAssertEqual(viewModel.shapes.count, 0)
        viewModel.addShape(.circle)
        XCTAssertEqual(viewModel.shapes, [.circle])
    }

    func testAddCircle() {
        viewModel.addCircle()
        XCTAssertEqual(viewModel.shapes, [.circle])
        XCTAssertEqual(viewModel.circles.count, 1)
    }

    func testClearAll() {
        viewModel.addShape(.circle)
        viewModel.addShape(.square)
        viewModel.clearAll()
        XCTAssertTrue(viewModel.shapes.isEmpty)
    }

    func testDeleteAllCircles() {
        viewModel.shapes = [.circle, .square, .circle, .triangle]
        viewModel.deleteAllCircles()
        XCTAssertEqual(viewModel.shapes, [.square, .triangle])
    }

    func testRemoveLastCircle() {
        viewModel.shapes = [.square, .circle, .triangle, .circle]
        viewModel.removeLastCircle()
        XCTAssertEqual(viewModel.shapes, [.square, .circle, .triangle])
    }

    func testCirclesProperty() {
        viewModel.shapes = [.circle, .square, .circle, .triangle]
        XCTAssertEqual(viewModel.circles, [.circle, .circle])
    }
}
