import UIKit
import SpriteKit
//Create necessary outlets
class ViewController: UIViewController {
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var generatorLabel: UILabel!
    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var hiddenView: UITextView!
    var scene: SKScene!
    var shapeScene: ShapeScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scene = SKScene(size: view.bounds.size)
        skView.presentScene(scene)
    }
    //Determine size + placement of diamond
    @IBAction func generateButtonTapped(_ sender: UIButton) {
        scene.removeAllChildren()
        guard let userInput = inputField.text,
              let sizeDouble = Double(userInput),
              let size = CGFloat(exactly: sizeDouble) else {
            hiddenView.text = "Please enter a number"
            return
        }
        
        if size > 400 {
                    hiddenView.text = "Please enter a number under 400"
                    return
                }
        
        var diamondPoints = [
            CGPoint(x: size / 2, y: 0),
            CGPoint(x: size, y: size / 2),
            CGPoint(x: size / 2, y: size),
            CGPoint(x: 0, y: size / 2),
            CGPoint(x: size / 2, y: 0)
        ]
        
        let diamondShape = SKShapeNode(points: &diamondPoints, count: diamondPoints.count)
        
        let sceneCenter = CGPoint(x: 0, y: 300)
        
        diamondShape.position = sceneCenter
        
        scene.addChild(diamondShape)
        inputField.text = ""
    }
}
