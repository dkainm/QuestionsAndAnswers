//
//  NewQuestionViewController.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 54//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class NewQuestionViewController: UIViewController {

    @IBOutlet weak var questionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        
        guard let text = questionField?.text else {print("no text available"); return}
        let question = NewQuestionInfo(question: text, id: 1)

        
        
        let postRequest = APIRequest()
//        postRequest.httpBody = parameters.percentEncoded()
        
        postRequest.save(question, completion: { result in
            switch result {
            case .success(let question):
                print("The following question has been sent: \(question.question)")
            case .failure(let error):
                print(error)
            }
        })
    }

}
