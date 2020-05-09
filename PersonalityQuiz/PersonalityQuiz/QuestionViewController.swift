//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Mohammad Subhan on 6/26/18.
//  Copyright © 2018 Mohammad Subhan. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    //Index of questions to keep track until end
    var questionIndex = 0
    //Label of question to change every round
    @IBOutlet weak var questionLabel: UILabel!
    //Progress view bar
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    //First all the views and their labels or button texts
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var answer5: UIButton!
    @IBOutlet weak var answer6: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var rLabel1: UILabel!
    @IBOutlet weak var rLabel2: UILabel!
    @IBOutlet weak var rLabel3: UILabel!
    @IBOutlet weak var rLabel4: UILabel!
    
    //Function to change for every question
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        //Get question and answers based on index
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        //Set the progress bar
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        //Set title and label
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers, using: currentQuestion.numAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers, using: currentQuestion.numAnswers)
        case .range:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    //Update functions
    func updateSingleStack(using answers: [Answer], using numAnswers: Int) {
        singleStackView.isHidden = false
        answer1.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        answer4.isHidden = true
        answer5.isHidden = true
        answer6.isHidden = true
        if numAnswers >= 1 {
            answer1.setTitle(answers[0].text, for: .normal)
            answer1.isHidden = false
        }
        if numAnswers >= 2 {
            answer2.setTitle(answers[1].text, for: .normal)
            answer2.isHidden = false
        }
        if numAnswers >= 3 {
            answer3.setTitle(answers[2].text, for: .normal)
            answer3.isHidden = false
        }
        if numAnswers >= 4 {
            answer4.setTitle(answers[3].text, for: .normal)
            answer4.isHidden = false
        }
        if numAnswers >= 5 {
            answer5.setTitle(answers[4].text, for: .normal)
            answer5.isHidden = false
        }
        if numAnswers == 6 {
            answer6.setTitle(answers[5].text, for: .normal)
            answer6.isHidden = false
        }
    }
    
    func updateMultipleStack(using answers: [Answer], using numAnswers: Int) {
        multipleStackView.isHidden = false
        label1.isHidden = true
        label2.isHidden = true
        label3.isHidden = true
        label4.isHidden = true
        label5.isHidden = true
        label6.isHidden = true
        switch1.isOn = false
        switch2.isOn = false
        switch3.isOn = false
        switch4.isOn = false
        switch5.isOn = false
        switch6.isOn = false
        if numAnswers >= 1 {
            label1.text = answers[0].text
            label1.isHidden = false
        }
        if numAnswers >= 2 {
            label2.text = answers[1].text
            label2.isHidden = false
        }
        if numAnswers >= 3 {
            label3.text = answers[2].text
            label3.isHidden = false
        }
        if numAnswers >= 4 {
            label4.text = answers[3].text
            label4.isHidden = false
        }
        if numAnswers >= 5 {
            label5.text = answers[4].text
            label5.isHidden = false
        }
        if numAnswers == 6 {
            label6.text = answers[5].text
            label6.isHidden = false
        }
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangeStackView.isHidden = false
        rangeSlider.setValue(0.5, animated: false)
        rLabel1.text = answers[0].text
        rLabel2.text = answers[1].text
        rLabel3.text = answers[2].text
        rLabel4.text = answers[3].text
    }
    
    
    //Keeping track of answers
    var answersChosen: [Answer] = []
    
    //Single answers
    @IBAction func singleAnswersPressed(_ sender: UIButton) {
        var currentAnswers = questions[questionIndex].answers
        switch sender {
        case answer1:
            answersChosen.append(currentAnswers[0])
        case answer2:
            answersChosen.append(currentAnswers[1])
        case answer3:
            answersChosen.append(currentAnswers[2])
        case answer4:
            answersChosen.append(currentAnswers[3])
        case answer5:
            answersChosen.append(currentAnswers[4])
        case answer6:
            answersChosen.append(currentAnswers[5])
        default:
            break
        }
        
        nextQuestion()
    }
    
    //Switch question answer collect
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch4: UISwitch!
    @IBOutlet weak var switch5: UISwitch!
    @IBOutlet weak var switch6: UISwitch!
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        if switch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if switch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if switch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if switch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        if switch5.isOn {
            answersChosen.append(currentAnswers[4])
        }
        if switch6.isOn {
            answersChosen.append(currentAnswers[5])
        }
        
        nextQuestion()
    }
    
    @IBOutlet weak var rangeSlider: UISlider!
    
    @IBAction func rangeButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        let slider = rangeSlider.value
        if slider < 0.25 {
            answersChosen.append(currentAnswers[0])
        }
        else if slider < 0.5 {
            answersChosen.append(currentAnswers[1])
        }
        else if slider < 0.75 {
            answersChosen.append(currentAnswers[2])
        }
        else {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    //Next question function to update page
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        }
        else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    //Prepare for segue, set the responses in results view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

}
