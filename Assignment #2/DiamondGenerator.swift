struct MyDiamondGenerator {
    
    func generationOf(diamond: Int) -> String {
        var result = ""
        let size = diamond
        
        //Create responses for invalid entries
        guard size > 1 else {
            return "Enter a number between 2 and 21"
        }
        guard size < 22 else {
            return "Enter a number between 2 and 21"
        }
        
    //Create an odd diamond
        if size % 2 != 0 {
            var space = size / 2 // Amount of spaces needed before going to the next line
            var stars = 1 // Amount of asterisks on the first line
            result += "Diamond with a size of \(size):\n"
            
            // Create a for loop for the upper half of the diamond
            for _ in 0..<(size / 2 + 1) {
                result += String(repeating: " ", count: space) + String(repeating: "*", count: stars) + "\n"
                stars += 2
            }
            
            // Create variables for the second for loop for bottom half
            space = size / 2
            stars = size - 2
            // Create a for loop for the bottom half of the diamond
            for _ in 0..<(size / 2) {
                result += String(repeating: " ", count: space) + String(repeating: "*", count: stars) + "\n"
                stars -= 2
            }
        } else { //Create an even diamond
            result += "Diamond with a size of \(size):\n"
            // Add a singular asterisk before the for loop
            result += String(repeating: " ", count: size) + "*"
            
            var space = size / 2
            var stars = 1
            
            // Create a for loop for the upper half of the diamond
            for _ in 0..<(size / 2) {
                result += String(repeating: " ", count: space * 2) + String(repeating: "* ", count: stars - 1) + "\n"
                stars += 2
            }

            // Create a for loop for the bottom half of the diamond
            for _ in 0..<(size / 2) {
                result += String(repeating: " ", count: space * 2) + String(repeating: "* ", count: stars - 1) + "\n"
                stars -= 2
            }
            
            // Add the singular asterisk at the bottom
            result += String(repeating: " ", count: size) + "* "
            }
        return result
    }
}
