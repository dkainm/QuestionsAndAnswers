//
//  QuestionRequest.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 14//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import Foundation

enum QuestionError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct QuestionRequest {
    
    let resourceURL: URL
    
    init() {
        
        let resourceString = "https://sinspython.herokuapp.com/allQuestion"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
        
    }
    
    func getQuestions(completion: @escaping(Result<[QuestionInfo], QuestionError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, responce, error in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let questionsResponce = try decoder.decode([QuestionInfo].self, from: jsonData)
                completion(.success(questionsResponce))
            } catch {
                completion(.failure(.canNotProcessData))
                print(error)
            }
            
        }
        dataTask.resume()
    }
    
}
