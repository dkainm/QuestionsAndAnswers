//
//  NoAnsweredTableViewController.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 14//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class NoAnsweredTableViewController: UITableViewController {

    var questionsArray = [NoAnsweredQuestionInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.questionsArray.count) Questions found"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.rowHeight = 40
        tableView.register(UINib(nibName: "NoAnsweredTableViewCell", bundle: nil), forCellReuseIdentifier: "noAnsweredTableCell")
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func getData() {
        let questionRequest = QuestionWithoutAnswerRequest()
        questionRequest.getQuestions { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let questions):
                self.questionsArray = questions
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noAnsweredTableCell", for: indexPath) as! NoAnsweredTableViewCell
        
        let question = questionsArray[indexPath.row]
        
        cell.config(question: question.question)
        
        return cell
    }

}
