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

    // -- End Outlets
    
    
    // -- Start Variables and Constants
        var currentValue: Int = 0
        var targetValue: Int = 0
    
    // -- End Variables and Constants
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // -- Give a default value in case slider is not move before hitting the button
        currentValue = lroundf(slider.value)
        
        // -- Generate a random number
        targetValue = 1 + Int(arc4random_uniform(100))
        
    }

    // -- Start Outlet actions
        @IBAction func HitMeButtonPressed(_ sender: UIButton) {
            
            showAlert()
        }
    
        @IBAction func sliderMoved(_ sender: UISlider) {
            
            currentValue = lroundf(slider.value)
            
            // -- Turn on for debugging
    //        print("The value of the slider is now: \(currentValue)")
            
        }
    
    // -- End Outlet actions
    
    
    
    // -- Start Custom Methods
        func showAlert() {
            let message = "The value of the silder is: \(currentValue) \nThe target value is \(targetValue)"
            
            let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }
    
    // -- End Custom Methods
}

