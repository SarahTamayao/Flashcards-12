//
//  ViewController.swift
//  Flashcards
//
//  Created by Shah Sikder on 2/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        questionLabel.clipsToBounds = true
        answerLabel.clipsToBounds = true
        
        questionLabel.layer.cornerRadius = 20.0
        answerLabel.layer.cornerRadius = 20.0
    }
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        print("First Tapped Card")
//        questionLabel.isHidden.toggle();
        if questionLabel.isHidden == true {
            questionLabel.isHidden = false
        } else {
            questionLabel.isHidden = true
        }
    }

    @IBOutlet weak var card: UIView!
    
    
    
    }
    





