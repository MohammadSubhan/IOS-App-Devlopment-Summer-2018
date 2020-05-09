//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Mohammad Subhan on 6/26/18.
//  Copyright © 2018 Mohammad Subhan. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var bigLabel: UILabel!
    @IBOutlet weak var smallLabel: UILabel!
    
    //Holding answers
    var responses: [Answer]!
    
    //calculations
    func calculatePersonalityResult() {
        navigationItem.hidesBackButton = true
        //Data structure outline
        var frequencyOfAnswers: [Sports: Int] = [:]
        //Map responses out
        let responseTypes = responses.map {$0.type}
        //Enter responses from map to outline
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response]
                ?? 0) + 1
        }
        //Grab the most occurring personality type
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 >
            $1.1 }.first!.key
        
        //Now update labels
        bigLabel.text = "You are a \(mostCommonAnswer)"
        smallLabel.text = mostCommonAnswer.definition
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
