//
//  ShapesGridView.swift
//  CricutShapeDrawer
//
//  Created by Deep kumar  on 5/18/25.
//

import Foundation
import SwiftUI

struct ShapesGridView: View {
    @StateObject private var viewModel = ShapesViewModel()
    @State private var showEditCircles = false

    let columns = [GridItem(.adaptive(minimum: 80))]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // TOP BUTTONS
                HStack {
                    Button("Clear All") {
                        viewModel.clearAll()
                    }
                    Spacer()
                    Button("Edit Circles") {
                        showEditCircles = true
                    }
                }
                .padding()

                // SHAPE GRID
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.shapes.indices, id: \.self) { index in
                            ShapeView(type: viewModel.shapes[index])
                        }
                    }
                    .padding()
                }

                // DYNAMIC BUTTONS
                Divider()
                HStack {
                    ForEach(viewModel.shapeButtons) { button in
                        Button(action: {
                            viewModel.addShape(button.draw_path)
                        }) {
                            Text(button.name)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .sheet(isPresented: $showEditCircles) {
                EditCirclesView(viewModel: viewModel)
            }
            .task {
                await viewModel.fetchButtons()
            }
        }
    }
}
