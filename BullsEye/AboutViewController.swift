//
//  AboutViewController.swift
//  BullsEye
//
//  Created by song on 4/10/22.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeButtonPressed(_ sender: UIButton) {
        close()
    }
    
    func close() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
