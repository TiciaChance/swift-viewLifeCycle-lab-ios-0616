//
//  ViewController.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var upperLeftSquare: UIView!
    @IBOutlet weak var middleLeftSquare: UIView!
    @IBOutlet weak var lowerLeftSquare: UIView!
    @IBOutlet weak var middleSquare: UIView!
    @IBOutlet weak var upperRightSquare: UIView!
    @IBOutlet weak var middleRightSquare: UIView!
    @IBOutlet weak var lowerRightSquare: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var orangeLabel: UILabel!
    @IBOutlet weak var yellowLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var purpleLabel: UILabel!
    
    var dieLabels: [UILabel] = []
    var dieViews: [UIView] = []
    
    //var to keep track of the number of rolls
    var numberOfRolls = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContainersForLabelsAndViews()
        hideLabels()
        hideViews()
       
    }
    
    func setupContainersForLabelsAndViews() {
        dieLabels = [redLabel, orangeLabel,yellowLabel,greenLabel, blueLabel, purpleLabel]
        dieViews = [upperLeftSquare, middleLeftSquare, lowerLeftSquare, middleSquare, upperRightSquare, middleRightSquare, lowerRightSquare]
    }
    
    func hideLabels() {
        for label in dieLabels { label.hidden = true }
    }
    
    func hideViews() {
        for view in dieViews {view.hidden = true }
    }
    
    @IBAction func rollDiceButton(sender: UIButton) {
        // sender is the memory addess of the UIButton
        //AnyObject allows me to pass in multiple types
        //changed the parameter from AnyOject to UIButton
        
        //if numberOfRolls is less than 6 then care on, else exit the function
        guard numberOfRolls < 6 else { print("Game Over"); return }
        
        //hide first 
        hideViews()
        
        let randomDieRoll = randomDiceRoll()
        
        //then it's unhiding it
        unhideViewWhenDiceIsRolled(randomDieRoll)
        updateScore(randomDieRoll)
    }
    
    func unhideViewWhenDiceIsRolled(number: Int) {
        switch number {
        case 1:
            middleSquare.hidden = false
        case 2:
            upperLeftSquare.hidden = false
            lowerRightSquare.hidden = false
        case 3:
            upperLeftSquare.hidden = false
            middleSquare.hidden = false
            lowerRightSquare.hidden = false
        case 4:
            upperLeftSquare.hidden = false
            lowerRightSquare.hidden = false
            upperRightSquare.hidden = false
            lowerLeftSquare.hidden = false
        case 5:
            upperLeftSquare.hidden = false
            lowerRightSquare.hidden = false
            upperRightSquare.hidden = false
            lowerLeftSquare.hidden = false
            middleSquare.hidden = false
        case 6:
            upperLeftSquare.hidden = false
            lowerRightSquare.hidden = false
            upperRightSquare.hidden = false
            lowerLeftSquare.hidden = false
            middleRightSquare.hidden = false
            middleLeftSquare.hidden = false
        default: assert(number < 6, "Invalid die roll \(number)")
            
        }
    }
    

func updateScore(number:Int) {
    
    guard numberOfRolls < 6 else { print("Game Over"); return }

    //needs to update the score labels with the result of the random roll.
    
    
    let label = dieLabels[numberOfRolls]
    label.text = String(number)
    label.hidden = false
    
    numberOfRolls += 1
    
    
}
    
 
// Returns back a random Int (1, 2, 3, 4, 5, or 6)
func randomDiceRoll() -> Int {
    return Int(arc4random_uniform(6) + 1)
}


}