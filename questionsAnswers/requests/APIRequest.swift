//
//  APIRequest.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 54//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import Foundation

enum APIError: Error {
    case responceProblem
    case decodingProblem
    case encodingProblem
}

struct APIRequest {
    
    let resourceURL: URL
    
    init() {
        let resourceString = "https://sinspython.herokuapp.com/newQuestion"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func save (_ questionToSave: NewQuestionInfo, completion: @escaping(Result<NewQuestionInfo, APIError>) -> Void) {
    
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
//            let parameters = [
//                        "answer" : message,
//                        "id" : "\((netData?.id)!)"
//            ]
//
//            request.httpBody = parameters.percentEncoded()
            
            urlRequest.httpBody = try JSONEncoder().encode(questionToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, responce, _ in
                guard let httpResponce = responce as? HTTPURLResponse, httpResponce.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responceProblem))
                    return
                }
                
                do {
                    let questionData = try JSONDecoder().decode(NewQuestionInfo.self, from: jsonData)
                    completion(.success(questionData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
        
    }
     
}
