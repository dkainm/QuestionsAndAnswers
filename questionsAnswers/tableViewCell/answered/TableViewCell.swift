//
//  TableViewCell.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 14//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var detailedLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func config(question: String, answer: String, author: String) {
        
        mainLabel?.text = question
        detailedLabel?.text = answer
        authorLabel?.text = author
    }
}
