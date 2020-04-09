//
//  NewQuestionModel.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 54//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import Foundation

final class NewQuestionInfo: Codable {
    var id: Int
    var question: String
    
    init (question: String, id: Int) {
        self.question = question
        self.id = id
    }
}
