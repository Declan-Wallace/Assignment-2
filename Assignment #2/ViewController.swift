//Import necessary kits
import UIKit

class ViewController: UIViewController {
    //Create IBOutlets for the View Controller Scene
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var generatorLabel: UILabel!
    @IBOutlet weak var outputField: UITextView!
    var shapeScene: ShapeScene!
    
    //Establish connecton to struct in other file
    let diamondGenerator = MyDiamondGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Establish where diamond will be put + size
    func generateDiamond(_ diamond: Int) {
        let diamondGenerator = MyDiamondGenerator()
        let diamondString = diamondGenerator.generationOf(diamond: diamond)
        outputField.text = diamondString
        outputField.textAlignment = .center
        let topInset = 0
        outputField.contentInset = UIEdgeInsets(top: CGFloat(topInset), left: 0, bottom: 0, right: 0)
        outputField.font = UIFont.systemFont(ofSize: 17)
    }
    //Make the button generate diamond when pressed
    @IBAction func generateButtonTapped(_ sender: AnyObject) {
        guard let text = inputField.text,
              let diamond = Int(text) else {
            outputField.text = "Enter a number between 2 and 21"
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

struct MyDiamondGenerator {
    
    func generationOf(diamond: Int) -> String {
        var result = ""
        let size = diamond
        //Create responses for invalid entries
        guard size > 1 else {
            return "Enter a number between 2 and 23"
        }
        guard size < 24 else {
            return "Enter a number between 2 and 23"
        }
        if diamond != Int(size) {
            return "Enter a number"
        }
        
    //Create an odd diamond
        if size % 2 != 0 {
            var space = size / 2 // Amount of spaces needed before going to the next line
            var stars = 1 // Amount of asterisks on the first line
            result += "Diamond with a size of \(size):\n"
            
            // Create a for loop for the upper half of the diamond
            for _ in 0..<(size / 2 + 1) {
                result += String(repeating: "", count: space - 1) + String(repeating: "*", count: stars) + "\n"
                stars += 2
            }
            
            // Create variables for the second for loop for bottom half
            space = size / 2
            stars = size - 2
            // Create a for loop for the bottom half of the diamond
            for _ in 0..<(size / 2) {
                result += String(repeating: "", count: space - 1) + String(repeating: "*", count: stars) + "\n"
                stars -= 2
            }
        } else { //Create an even diamond
            result += "Diamond with a size of \(size):\n"
            // Add a singular asterisk before the for loop
            result += String(repeating: "", count: size) + "*"
            
            let space = size / 2
            var stars = 1
            
            // Create a for loop for the upper half of the diamond
            for _ in 0..<(size / 2) {
                result += String(repeating: "", count: space - 1) + String(repeating: "* ", count: stars - 1) + "\n"
                stars += 2
            }

            // Create a for loop for the bottom half of the diamond
            for _ in 0..<(size / 2) {
                result += String(repeating: "", count: space - 1) + String(repeating: "* ", count: stars - 1) + "\n"
                stars -= 2
            }
            
            // Add the singular asterisk at the bottom
            result += String(repeating: "", count: size) + "* "
            }
        return result
    }
}
