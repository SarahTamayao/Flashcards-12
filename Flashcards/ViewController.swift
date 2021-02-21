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
    }
    

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        questionLabel.isHidden = true;
    }
    
}

