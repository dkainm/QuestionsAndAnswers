//
//  NoAnsweredViewController.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 14//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class NoAnsweredViewController: UIViewController {

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
        tv.register(UINib(nibName: "NoAnsweredTableViewCell", bundle: nil),forCellReuseIdentifier: "noAnsweredTableCell")
    }
        
    func getData() {
        let questionRequest = QuestionRequest(ending: "allQuestionNoAnswer")
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


extension NoAnsweredViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noAnsweredTableCell", for: indexPath) as! NoAnsweredTableViewCell
        
        let question = questionsArray[indexPath.row]
        
        cell.config(question: question.question, author: question.asking_Name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let question = questionsArray[indexPath.row]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewQuestionViewController") as! ViewQuestionViewController
        
        newViewController.question = question
        
        navigationController?.show(newViewController, sender: nil)
    }
    
}
