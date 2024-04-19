//Import necessary kits
import UIKit

class ViewController: UIViewController {
    //Create IBOutlets for the View Controller Scene
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var generatorLabel: UILabel!
    @IBOutlet weak var outputField: UITextView!
    
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
        outputField.font = UIFont.systemFont(ofSize: 18)
    }
    //Make the button generate diamond when pressed
    @IBAction func generateButtonTapped(_ sender: AnyObject) {
        guard let text = inputField.text,
              let diamond = Int(text) else {
            generatorLabel.text = ""
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
