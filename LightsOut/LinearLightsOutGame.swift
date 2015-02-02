import UIKit
import Foundation
class LinearLightsOutGame : Printable{
    var lightStates : [Bool]
    var moves : Int
    var won : Bool
    
    init(numLights: Int) {
        self.moves = 0
        self.won = false
        self.lightStates = [Bool]()
        for index in Range(0..<numLights) {
            var rand = arc4random_uniform(2)
            self.lightStates.append(rand == 1)
            
        }
    }
    func outputGameState() -> String {
        if (self.won) {
            return "You've won in \(self.moves) moves"
        } else {
            return "Move #\(self.moves+1)"
        }
    }
    var description : String {
        var returnString = ""
        for light in self.lightStates {
            returnString += light ? "1" : "0"
        }
        return "Lights: \(returnString) Moves: \(self.moves)"
    }
    
    func pressedLightAtIndex(index : Int) -> Bool {
        // could be optimized to only have 1 call to check win
        if checkWin() {
            return true
        }
        // you made a move
        self.moves++
        // flip clicked light
        self.lightStates[index] = !self.lightStates[index]
        // if not at the lower end, flip light on the left
        if (index != 0) {
            self.lightStates[index-1] = !self.lightStates[index-1]
        }
        // if not at the upper end, flip light on the right
        if (index != self.lightStates.count-1) {
            self.lightStates[index+1] = !self.lightStates[index+1]
        }
        return checkWin()
    }
    
    func checkWin() -> Bool {
        for light in self.lightStates {
            if light {
                return false
            }
        }
        self.won = true
        return true;
    }
}



