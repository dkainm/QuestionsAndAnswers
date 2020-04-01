//
//  AnsweredQuestionsModel.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 283//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//
import Foundation

struct QuestionResponce: Decodable {
    var responce: Questions
}

struct Questions: Decodable {
    var questions: [QuestionInfo]
}

struct QuestionInfo: Decodable {
    var answer: String
    var question: String
}
