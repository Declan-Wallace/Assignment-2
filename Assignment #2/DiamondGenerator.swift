import Foundation
let diamondWidth = 100
let diamondHeight = 100

let diamondPoints = [
    Point(),
    Point(x: 50, y: 100),
    Point(x: 100, y: 200),
    Point(x: 150, y: 100)
]

let diamondShape = PolygonShape(points: diamondPoints)

func setup() {
    diamondShape.position = Point(x: 200, y: 150)
    diamondShape.fillColor = .blue
    scene.add(diamondShape)
}
