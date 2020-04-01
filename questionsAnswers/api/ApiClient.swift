//
//  ApiClient.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 283//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

struct APIClient {

    let viewController: ViewController
    
    func fetchData() {
         guard let file = Bundle.main.path(forResource: "tableData", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: file), options: []),
            let companies = try? JSONDecoder().decode(Questions.self, from: data) else { return }
    }
}
