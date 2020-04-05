//
//  OneQuestionModel.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 34//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import Foundation

struct OneQuestionInfo: Decodable {
    var question: String
    var answer: String?
    var asking_Name: String
    var expert_Name: String?
}
