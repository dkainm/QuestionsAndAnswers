//
//  NoAnsweredTableViewCell.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 14//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class NoAnsweredTableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func config(question: String, author: String) {
        mainLabel?.text = question
        authorLabel?.text = author
    }
    
}
