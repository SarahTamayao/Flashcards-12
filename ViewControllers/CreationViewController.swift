//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Shah Sikder on 3/6/21.
//

import UIKit

class CreationViewController: UIViewController {
    
    
    @IBOutlet weak var extraAnswerOne: UITextField!
    
    @IBOutlet weak var extraAnswerTwo: UITextField!
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    var initialQuestion: String?
    var initialAnswer: String?
    // var answerOne: String?
    // var answerTwo: String?
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // extraAnswerOne.text = answerOne
        // extraAnswerTwo.text = answerTwo
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated:true)
    }

        
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let questionText = questionTextField.text
        
        let answerText = answerTextField.text
        
        let answer1Text = extraAnswerOne.text
        
        let answer2Text = extraAnswerTwo.text
        
        if questionText == nil || answerText == nil || answer1Text == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty ||
            answer1Text!.isEmpty ||
            answer2Text!.isEmpty
            {
            let alert = UIAlertController(title: "Missing Text", message: "You need to enter both a question and an answer", preferredStyle: .alert)
            present(alert, animated:true)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
        } else {
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, answer1: answer1Text, answer2: answer2Text)
            
            dismiss(animated: true)
            
            
        }
        
        
        
    }
    
       
        
        
    
}
