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
    
    var question: QuestionInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    func getData() {
            let questionRequest = OneQuestionRequest(id: question.id)
            questionRequest.getQuestions { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let question):
                    print(question)
                    DispatchQueue.main.async {
                        self.questionLabel.text = "\(question.question)"
                        self.askedByLabel.text = "\(question.asking_Name)"
                        
                        guard let answer = question.answer else {return}
                        self.answerLabel.text = "\(answer)"
                        guard let expert = question.expert_Name else {return}
                        self.answeredByLabel.text = "\(expert)"
                    }
                }
                
            }
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        
    }
    
}
