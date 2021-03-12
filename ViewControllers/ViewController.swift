//
//  ViewController.swift
//  Flashcards
//
//  Created by Shah Sikder on 2/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var buttonOptionOne: UIButton!
    @IBOutlet weak var buttonOptionTwo: UIButton!
    @IBOutlet weak var buttonOptionThree: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buttonOptionOne.layer.cornerRadius = 20.0
        buttonOptionTwo.layer.cornerRadius = 20.0
        buttonOptionThree.layer.cornerRadius = 20.0
        
        buttonOptionOne.layer.borderWidth = 3.0
        buttonOptionOne.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        buttonOptionTwo.layer.borderWidth = 3.0
        buttonOptionTwo.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        buttonOptionThree.layer.borderWidth = 3.0
        buttonOptionThree.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        card.layer.borderWidth = 3.0
        card.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
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
    func updateFlashcard(question: String, answer: String, answer1: String?, answer2: String?) {
        questionLabel.text = question
        answerLabel.text = answer
        
        buttonOptionOne.setTitle(answer1, for: .normal)
        buttonOptionTwo.setTitle(answer, for: .normal)
        buttonOptionThree.setTitle(answer2, for: .normal)
        
    }
    
    @IBAction func didTapOptionOne(_ sender: Any) {
        buttonOptionOne.isHidden = true
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        questionLabel.isHidden = true
    }
    
    @IBAction func didTapOptionThree(_ sender: Any) {
        buttonOptionThree.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
        creationController.initialQuestion = questionLabel.text
        creationController.initialAnswer = answerLabel.text
        if segue.identifier == "EditSegue" {
            creationController.initialQuestion = questionLabel.text
            creationController.initialAnswer = answerLabel.text
        }
    }
    
    
    }
    





