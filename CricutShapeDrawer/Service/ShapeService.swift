//
//  ShapeService.swift
//  CricutShapeDrawer
//
//  Created by Deep kumar  on 5/19/25.
//

import Foundation

class ShapeService {
    func fetchShapeButtons() async throws -> [ShapeButton] {
        guard let url = URL(string: "http://staticcontent.cricut.com/static/test/shapes_001.json") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(ShapeButtonResponse.self, from: data)
        return decoded.buttons
    }
}
