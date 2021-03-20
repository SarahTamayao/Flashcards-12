//
//  ViewController.swift
//  Flashcards
//
//  Created by Shah Sikder on 2/20/21.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    var answer1: String
    var answer2: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var buttonOptionOne: UIButton!
    @IBOutlet weak var buttonOptionTwo: UIButton!
    @IBOutlet weak var buttonOptionThree: UIButton!
    
    var flashcards = [Flashcard]()
    
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            updateFlashcard(question: "Whats the capital of Brazil", answer: "Brasilia", answer1: "Madrid", answer2: "San Jose")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
        
        updateFlashcard(question: "Whats the capital of Brazil?", answer: "Brasilia", answer1: "Madrid", answer2: "San Jose")

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
        let flashcard = Flashcard(question: question, answer: answer, answer1: answer1!, answer2: answer2!)
        questionLabel.text = question
        answerLabel.text = answer
        
       
        flashcards.append(flashcard)
        print("Added new flashcard")
        print("We now have \(flashcards.count) flashcards")
        
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        updateNextPrevButtons()
        
        buttonOptionOne.setTitle(answer1, for: .normal)
        buttonOptionTwo.setTitle(answer, for: .normal)
        buttonOptionThree.setTitle(answer2, for: .normal)
        
        updateLabels()
        
        saveAllFlashcardsToDisk()
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
    
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        
        questionLabel.text = currentFlashcard.question
        answerLabel.text = currentFlashcard.answer
        
    }
    
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        currentIndex = currentIndex - 1
        
        updateLabels()
        
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
        currentIndex = currentIndex + 1
        
        updateLabels()
        
        updateNextPrevButtons()
    }
    func updateNextPrevButtons() {
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        if currentIndex == 0{
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func saveAllFlashcardsToDisk() {
        
        let dictionaryArray = flashcards.map { (card) -> [String : String] in
            return ["question":card.question, "answer":card.answer, "answer1":card.answer1, "answer2":card.answer2]
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        print("Flashcards saved to userdefaults")
    }
    
    func readSavedFlashcards() {
    if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
        let savedCards = dictionaryArray.compactMap { dictionary -> Flashcard in
            return Flashcard(question: dictionary["question"] ?? "placeholder", answer: dictionary["answer"] ?? "placeholder", answer1: dictionary["answer1"] ?? "placeholder", answer2: dictionary["answer2"] ?? "placeholder")
        }
        flashcards.append(contentsOf: savedCards)
    }
    
    }
}
    





