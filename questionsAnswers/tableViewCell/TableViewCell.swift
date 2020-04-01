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
    
    func config(question: String, answer: String) {
        
        mainLabel?.text = question
        detailedLabel?.text = answer
        
    }
}
