//
//  AnsweredQuestionsModel.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 283//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//
import Foundation

struct QuestionInfo: Decodable {
    var answer: String?
    var expert_Name: String?
    var question: String
    var asking_Name: String
    var id: Int
}
