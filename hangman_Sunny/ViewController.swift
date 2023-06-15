//
//  ViewController.swift
//  hangman_Sunny
//
//  Created by Anush Sharma on 2023-06-14.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var keyboardLine1: UIStackView!
    @IBOutlet weak var keyboardLine2: UIStackView!
    @IBOutlet weak var keybardLine3: UIStackView!
    @IBOutlet weak var hangImage: UIImageView!
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var loss: UILabel!
    
    @IBOutlet weak var guessInput: UIStackView!
    var guessWords = ["AGAINST","AIRLINE","AIRPORT","ALCOHOL","ALLEGED","ALREADY","AMATURE","BALCONY","BINDING","BLANKET","BROTHER","CAPTAIN","CAPABLE","CHICKEN","CORRECT","DAYTIME","DECLINE","DELIVER","EDITION","ENHANCE","ETHICAL","FARTHER","FITNESS","FINANCE","FISHING","FORMULA","GENUIEN","GIGABIT","GREATER","HEARING","HELPFUL","HOLIDAY","HIGHWAY","IMPROVE","INVOICE","JOURNEY","JUSTICE","JUSTIFY","JOINTLY","KILLING","KNOWING","LARGELY","LASTING","KITCHEN","LANDING","LASTING","LEADING","LEANING"]
    
    //some more to be added
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func effortToInput(_ sender: Any) {
        
//      
        
    }
}

