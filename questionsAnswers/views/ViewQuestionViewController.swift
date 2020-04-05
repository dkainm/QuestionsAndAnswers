//
//  ViewQuestionViewController.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 34//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class ViewQuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var askedByLabel: UILabel!
    @IBOutlet weak var answeredByLabel: UILabel!
    @IBOutlet weak var answeredView: UIView!
    @IBOutlet weak var answerField: UITextField!
    
    var noAnsweredQuestion: NoAnsweredQuestionInfo!
    var answeredQuestion: QuestionInfo!
    var isQuestionAnswered: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answeredView.isHidden = true
        getData(isQuestionAnswered: isQuestionAnswered)
    }

    func getData(isQuestionAnswered: Bool) {
        self.isQuestionAnswered = isQuestionAnswered
        
        if isQuestionAnswered {
            let questionRequest = OneQuestionRequest(id: answeredQuestion.id)
            questionRequest.getQuestions { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let question):
                    print(question)
                    DispatchQueue.main.async {
                        self.answeredView.isHidden = false
                        
                        guard let answer = question.answer else {return}
                        guard let expert = question.expert_Name else {return}
                        
                        self.questionLabel.text = "\(question.question)"
                        self.answerLabel.text = "\(answer)"
                        self.askedByLabel.text = "\(question.asking_Name)"
                        self.answeredByLabel.text = "\(expert)"
                    }
                }
                
            }
        } else {
            let questionRequest = OneQuestionRequest(id: noAnsweredQuestion.id)
            questionRequest.getQuestions { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let question):
                    print(question)
                    DispatchQueue.main.async {
                        self.questionLabel.text = "\(question.question)"
                        self.askedByLabel.text = "\(question.asking_Name)"
                    }
                }
                
            }
        }
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        
    }
    
}
