//Import necessary kits
import UIKit
import Foundation

class ViewController: UIViewController {
    //Create IBOutlets for the View Controller Scene
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var generatorLabel: UILabel!
    @IBOutlet weak var outputField: UITextView!
    var shapeScene: ShapeScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Establish where diamond will be put + size
    func generateDiamond(_ diamond: Int) {
        let diamondGenerator = MyDiamondGenerator()
        outputField.hoverStyle?.shape = MyDiamondGenerator.diamondShape
        outputField.textAlignment = .center
        let topInset = 0
        outputField.contentInset = UIEdgeInsets(top: CGFloat(topInset), left: 0, bottom: 0, right: 0)
        outputField.font = UIFont.systemFont(ofSize: 17)
    }
    //Make the button generate diamond when pressed
    @IBAction func generateButtonTapped(_ sender: AnyObject) {
        guard let text = inputField.text,
              let diamond = Int(text) else {
            outputField.text = "Enter a number between 2 and 23"
            outputField.textAlignment = .center
            let topInset = 0
            outputField.contentInset = UIEdgeInsets(top: CGFloat(topInset), left: 0, bottom: 0, right: 0)
            outputField.font = UIFont.systemFont(ofSize: 17)
            return
        }
        
        generateDiamond(diamond)
    }
}

extension ViewController: UITextFieldDelegate {
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text,
              let diamond = Int(text) else {
            return
        }
        
        generateDiamond(diamond)
    }
    
    @IBAction func editingChanged(_ textField: UITextField) {
        guard let text = textField.text else {
            generateButton.isEnabled = false
            return
        }
        
        generateButton.isEnabled = !text.isEmpty
    }
}

let usersInput = inputField.text
    let diamondPoints = [
        Point(x: usersInput,y: usersInput/2),
        Point(x: usersInput/2, y: 0),
        Point(x: 0, y: usersInput/2),
        Point(x: usersInput/2, y: usersInput)
    ]
    
    let diamondShape = PolygonShape(points: diamondPoints)
    
    func setup() {
        diamondShape.position = Point(x: 200, y: 150)
        diamondShape.fillColor = .blue
        scene.add(diamondShape)
    }
}
