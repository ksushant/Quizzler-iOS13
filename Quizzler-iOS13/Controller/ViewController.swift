//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle ?? ""
        quizBrain.checkAnswer(userAnswer)
        
        let actualAnswer = quiz[questionNumber].answer

        if userAnswer == actualAnswer {
            print("Correct!")
            sender.backgroundColor = UIColor.green
        } else {
            print("Incorrect!")
            sender.backgroundColor = UIColor.red
        }

        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }

        Timer.scheduledTimer(
            timeInterval: 0.2, target: self, selector: #selector(updateUI),
            userInfo: nil, repeats: false)

    }

    @objc
    func updateUI() {
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
}
