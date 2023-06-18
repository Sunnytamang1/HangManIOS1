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
    
    var current = ""
    var leftGuess = 7
    var totalWin = 0
    var totalLoss = 0
    var incorrectGuess = 1
    var currentGuess: [Character] = []
    var guessWords = ["AGAINST","AIRLINE","AIRPORT","ALCOHOL","ALLEGED","ALREADY","AMATURE","BALCONY","BINDING","BLANKET","BROTHER","CAPTAIN","CAPABLE","CHICKEN","CORRECT","DAYTIME","DECLINE","DELIVER","EDITION","ENHANCE","ETHICAL","FARTHER","FITNESS","FINANCE","FISHING","FORMULA","GENUIEN","GIGABIT","GREATER","HEARING","HELPFUL","HOLIDAY","HIGHWAY","IMPROVE","INVOICE","JOURNEY","JUSTICE","JUSTIFY","JOINTLY","KILLING","KNOWING","LARGELY","LASTING","KITCHEN","LANDING","LASTING","LEADING","LEANING"]
    
    //some more to be added
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        beginFromHere()
    }

    func beginFromHere(){
        //taking every variable to the initial state s well as the interface elements
        
//        hangImage.image = UIImage(named: "1")
        current = guessWords.randomElement()!
        print(current)
        currentGuess = Array(repeating: "_", count: current.count)
        leftGuess = 6
        incorrectGuess = 1
        
        keyboardLine1.arrangedSubviews.forEach{
            s in
            if let btn = s as? UIButton{
                btn.isEnabled = true
                btn.backgroundColor = UIColor.systemBackground
                
            }
        }
        keyboardLine2.arrangedSubviews.forEach{
            s in
            if let btn = s as? UIButton{
                btn.isEnabled = true
                btn.backgroundColor = UIColor.systemBackground
                
            }
        }
        keybardLine3.arrangedSubviews.forEach{
            s in
            if let btn = s as? UIButton{
                btn.isEnabled = true
                btn.backgroundColor = UIColor.systemBackground
                
            }
        }
        guessInput.arrangedSubviews.forEach{ s in
            if let fields = s as? UITextField {
                fields.backgroundColor = UIColor.systemBackground
                fields.text = ""
            }
        }
     
      
        
        
    }
    
    
    @IBAction func effortToInput(_ sender: UIButton) {
        
//
        
        guard let n = sender.titleLabel?.text?.first else {return}
        
        if current.contains(n){
            for (index, char) in current.enumerated(){
                if char == n {
                    currentGuess[index] = n
                }
                
                //call update function here
                enteredGuess()
                sender.backgroundColor = UIColor.systemGreen
                
                
                if !currentGuess.contains("_"){
                    
                    //call alert or dialouge for win here
                    let alert = UIAlertController(title: "Woohoo!", message: "I'm safe! Would you like to play again?", preferredStyle: .alert)
                    let forYes = UIAlertAction(title: "Yes", style: .default){
                        _ in
                        self.beginFromHere()
                    }
                    let forNo = UIAlertAction(title: "No", style: .cancel){
                        _ in self.incorrectGuess = 1
                    }
                    alert.addAction(forYes)
                    alert.addAction(forNo)
                    
                    present(alert, animated: true, completion: nil)
                    totalWin += 1
                    wins.text = "Wins: \(totalWin)"
                }
            }
        }
        else{
            leftGuess = leftGuess - 1
            print(leftGuess)
            incorrectGuess = incorrectGuess + 1
            //update the image here
            changeImage()
            sender.backgroundColor = UIColor.systemBackground
            
            
            if leftGuess == 0 {
                // show the dialouge for the loss
                
                let alert = UIAlertController(title: "Sorry", message: "The correct word was \(current). Would you like to play again?", preferredStyle: .alert)
                let forYes = UIAlertAction(title: "Yes", style: .default){
                    _ in
                    self.beginFromHere()
                }
                let forNo = UIAlertAction(title: "No", style: .cancel){
                    _ in self.incorrectGuess = 1
                }
                alert.addAction(forYes)
                alert.addAction(forNo)
//                alert.present(alert,animated: true, completion: nil)
                self.view.window?.rootViewController?.present(alert, animated: true, completion: nil)
                totalLoss = totalLoss + 1
                print("Loss Count\(totalLoss)")
                loss.text = "Losses: \(totalLoss)"
            }
        }
        
        
    }
    
    func changeImage(){
        hangImage.image = UIImage(named: "\(7-leftGuess)")
    }
    
    func enteredGuess(){
        guessInput.arrangedSubviews.enumerated().forEach {
            (i,s) in
            if let texts = s as? UITextField {
                texts.text = String(currentGuess[i])
                
                texts.textColor = UIColor.black
                
                if currentGuess[i] != "_" {
                    texts.backgroundColor = UIColor.green  //for correct letter
                }
            }
        }
    }
    
}

