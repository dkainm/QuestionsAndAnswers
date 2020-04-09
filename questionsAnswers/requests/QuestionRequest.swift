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
    
    init(ending: String) {
        
        let resourceString = "https://sinspython.herokuapp.com/\(ending)"
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

struct OneQuestionRequest {
    
    let resourceURL: URL
    
    init(id: Int) {
        
        let resourceString = "https://sinspython.herokuapp.com/oneQuestion/\(id)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
        
    }
    
    func getQuestions(completion: @escaping(Result<OneQuestionInfo, QuestionError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, responce, error in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let questionsResponce = try decoder.decode(OneQuestionInfo.self, from: jsonData)
                completion(.success(questionsResponce))
            } catch {
                completion(.failure(.canNotProcessData))
                print(error)
            }
            
        }
        dataTask.resume()
    }
    
}
