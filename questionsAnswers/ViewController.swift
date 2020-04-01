//
//  ViewController.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 263//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tv: UITableView!
    
    var questionsArray = [QuestionInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.tv.reloadData()
                self.navigationItem.title = "\(self.questionsArray.count) Questions found"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegates()
        getData()
    }
    
    func delegates() {
        tv.delegate = self
        tv.dataSource = self
    }
    
    func getData() {
        let questionRequest = QuestionRequest()
        questionRequest.getQuestions { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let questions):
                self.questionsArray = questions
            }
        }
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        let question = questionsArray[indexPath.row]
        
        cell.textLabel?.text = question.question
        cell.detailTextLabel?.text = question.answer
        
        return cell
    }
    
}



