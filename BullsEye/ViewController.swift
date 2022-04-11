//
//  ViewController.swift
//  BullsEye
//
//  Created by song on 4/10/22.
//

import UIKit

class ViewController: UIViewController {

    // -- Start Outlets
        @IBOutlet weak var slider: UISlider!

    @IBOutlet weak var sliderNumber: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
        @IBOutlet weak var scoreLbel: UILabel!
        @IBOutlet weak var roundLabel: UILabel!
    
        @IBOutlet weak var startOverButton: UIButton!
    
    // -- End Outlets
    
    
    // -- Start Variables and Constants
        var currentValue = 0
        var targetValue = 0
        var score: Int = 0
        var round = 1
    
        var alertTitle: String = ""
    
    // -- End Variables and Constants
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // -- Give a default value in case slider is not move before hitting the button
        currentValue = lroundf(slider.value)
        
        // -- Generate a random number
        //targetValue = 1 + Int(arc4random_uniform(100))
        // -- Clear all the labels
        startOver()
        
        startNewRound()
        updateLabels()
    }

    // -- Start Outlet actions
        @IBAction func HitMeButtonPressed(_ sender: UIButton) {
            
            showAlert()
            
            // -- Start a new round
            startNewRound()
            updateLabels()
        }
    
        @IBAction func sliderMoved(_ sender: UISlider) {
            
            currentValue = lroundf(slider.value)
            
            // -- Turn on for debugging
    //        print("The value of the slider is now: \(currentValue)")
            
            sliderNumber.text = "\(currentValue)"
            
        }
    
        
    @IBAction func startOverButtonPressed(_ sender: UIButton) {
        startOver()
    }
    
    
    // -- End Outlet actions
    
    
    
    // -- Start Custom Methods
        func showAlert() {
            
            // -- Calculate the currentValue and targetValue difference
            var difference: Int = 0
            
            
            difference = abs(currentValue - targetValue)
            var points = 100 - difference
            score += points
            round += 1
            
            
            let message = "The value of the silder is: \(currentValue) \nThe target value is \(targetValue). \nThe difference is \(difference). \nYou scored \(points) points."
            
            // Display the title depends on how close the hit
            
            switch difference {
            case 0:
                alertTitle = "Perfect!"
                
                // -- Give the player an extra 100 points
                points += 100
            case 1...5:
                alertTitle = "You almost had it!"
            case 6...10:
                alertTitle = "Pretty good!"
            default:
                alertTitle = "Not even close..."
            }
            
            
            
            
            let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
//        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func startOver() {
        
        score = 0
        round = 1
        
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLbel.text = "\(score)"
        roundLabel.text = "\(round)"
    }
    
    // -- End Custom Methods
}

