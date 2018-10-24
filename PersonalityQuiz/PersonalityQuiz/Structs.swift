//
//  Structs.swift
//  PersonalityQuiz
//
//  Created by Mohammad Subhan on 6/26/18.
//  Copyright © 2018 Mohammad Subhan. All rights reserved.
//

import Foundation

//Make a Question object holding type and answers

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
    var numAnswers: Int
}

enum ResponseType {
    case single, multiple, range
}

struct Answer {
    var text: String
    var type: Sports
}

enum Sports {
    case basketball, football, soccer, baseball
    
    var definition: String {
        switch self {
        case .baseball:
            return "You a baseball"
        case .football:
            return "You a football"
        case .soccer:
            return "You a soccer ball"
        case .basketball:
            return "You a basketball"
        }
    }
}



var questions: [Question] = [
    Question(text: "Who's your favirote athlete", type: .single,
    answers: [Answer(text: "Lebron", type: .basketball),
              Answer(text: "Jackie", type: .baseball),
              Answer(text: "Rg3", type: .football),
              Answer(text: "Steph", type: .basketball),
              Answer(text: "Brady", type: .football),
              Answer(text: "Messi", type: .soccer)], numAnswers: 6),
    Question(text: "Select every way to score 7 points", type: .multiple,
     answers: [Answer(text: "Score a 3 pointer and 2 2 pointers", type: .basketball),
               Answer(text: "score 3 runs followed a homerun with all bases filled", type: .baseball),
               Answer(text: "score a touchdown", type: .football),
               Answer(text: "score 2 3 pointers and a free throw", type: .basketball),
               Answer(text: "score a run in each of the first 7 innings", type: .baseball),
               Answer(text: "score 7 goals", type: .soccer)], numAnswers: 6),
    Question(text: "How much do you run", type: .range,
     answers: [Answer(text: "not very much", type: .baseball),
               Answer(text: "a little", type: .football),
               Answer(text: "a decent amount", type: .basketball),
               Answer(text: "a lot", type: .soccer)], numAnswers: 4),
]
