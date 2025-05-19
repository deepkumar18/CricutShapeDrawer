//
//  EditCirclesView.swift
//  CricutShapeDrawer
//
//  Created by Deep kumar  on 5/18/25.
//

import Foundation
import SwiftUI

/// View for editing circles specifically from the main shape grid
/// Allows adding, removing, and deleting all circle shapes
struct EditCirclesView: View {
    @ObservedObject var viewModel: ShapesViewModel

    /// Grid layout with adaptive sizing for circle shapes
    private let columns = [GridItem(.adaptive(minimum: 80))]
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            VStack {
                /// Displays all current circles in a scrollable grid
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<viewModel.circles.count, id: \.self) { _ in
                            ShapeView(type: .circle)
                        }
                    }
                    .padding()
                }

                /// Buttons to manipulate circle shapes
                HStack(spacing: 12) {
                    Button("Delete All") {
                        viewModel.deleteAllCircles()
                    }

                    Button("Add") {
                        viewModel.addCircle()
                    }

                    Button("Remove") {
                        viewModel.removeLastCircle()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .buttonStyle(.borderedProminent)
            }

            /// Navigation bar configuration
            .navigationTitle("Edit Circles")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        dismiss()
                    }
                }
            }
        }
    }
}
