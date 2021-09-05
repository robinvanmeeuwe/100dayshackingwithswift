//
//  AppDelegate.swift
//  Tutorial - project 2
//
//  Created by Robin van Meeuwen on 16/06/21.
//  Copyright © 2021 Robin van Meeuwen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAwnser = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAwnser = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAwnser].uppercased()
    }
    
    @IBAction func buttontapped(_ sender: UIButton) {
        var title: String
        
        
        if sender.tag == correctAwnser {
            title = "correct"
            score += 1
        }else {
            title = "wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "your score is: \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    


}

