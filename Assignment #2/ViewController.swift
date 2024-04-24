import UIKit
import SpriteKit

class ViewController: UIViewController {
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var generatorLabel: UILabel!
    @IBOutlet weak var skView: SKView!
    var scene: SKScene!
    var shapeScene: ShapeScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scene = SKScene(size: view.bounds.size)
        skView.presentScene(scene)
    }
    
    @IBAction func generateButtonTapped(_ sender: UIButton) {
        let size: CGFloat = 200 // Default size
        var diamondPoints = [
            CGPoint(x: 0, y: size / 2),
            CGPoint(x: size / 2, y: size),
            CGPoint(x: size, y: size / 2),
            CGPoint(x: size / 2, y: 0),
            CGPoint(x: 0, y: size / 2) // Closing point
        ]
        
        let diamondShape = SKShapeNode(points: &diamondPoints, count: diamondPoints.count)
        
        let sceneCenter = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        diamondShape.position = sceneCenter
        
        scene.addChild(diamondShape)
    }
}
