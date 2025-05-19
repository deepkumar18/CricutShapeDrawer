CricutShapeDrawer

CricutShapeDrawer is a SwiftUI app that allows users to draw basic shapes like circles, squares, and triangles based on a JSON file fetched from a remote URL. The app displays these shapes in a grid layout and includes a separate screen to manage circle shapes specifically.

The app is built using SwiftUI and follows the MVVM architecture. It works on both iPhone and iPad.

 Features

- Fetches shape button data from a remote JSON file
- Tapping a button adds the corresponding shape to the grid
- “Clear All” button removes all shapes
- “Edit Circles” screen allows adding/removing only circle shapes
- Layout adapts for both iPhone and iPad
- Clean architecture using MVVM and async/await for networking

Project Structure

- Models/
- ViewModels/
- Views/
- Services/

 How to Run

1. Clone the repository
2. Open CricutShapeDrawer.xcodeproj in Xcode
3. Run the project on an iPhone or iPad simulator.

Notes

- Only uses Apple frameworks (no third-party libraries)





