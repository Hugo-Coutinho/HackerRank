//   6
//    #
//   ##
//  ###
// ####
//#####
//######

func staircase(n: Int) -> Void {
    let char = "#"
    var finalString = ""
    var spacing = n
    
    for (i, _) in [Int](1...n).enumerated() {
        
        while(spacing > 1) {
            finalString += " "
            spacing -= 1
        }
        
        for (_, _) in [Int](0...i).enumerated() {
            finalString += char
        }
        print(finalString)
        finalString = ""
        spacing = n - (i + 1)
    }
}

staircase(n: 6)
