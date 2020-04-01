//
//  helper.swift
//  questionsAnswers
//
//  Created by Alex Rudoi on 283//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

//GET

//    guard let url = URL(string: "https://sinspython.herokuapp.com/allQuestion") else { return }
//
//    let session = URLSession.shared
//    session.dataTask(with: url) { (data, responce, error) in
//        if let responce = responce {
//            print(responce)
//        }
//
//        guard let data = data else { return }
//        print(data)
//
//        do {
//            let json = try JSONSerialization.jsonObject(with: data, options: [])
//            print(json)
//        } catch {
//            print(error)
//        }
//    }.resume()


//POST


//    guard let url = URL(string: "https://sinspython.herokuapp.com/allQuestion") else { return }
//    let parameters = ["question": "this is question?", "expert": "1"]
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
//    request.httpBody = httpBody
//
//    let session = URLSession.shared
//    session.dataTask(with: request) { (data, responce, error) in
//        if let responce = responce {
//            print(responce)
//        }
//
//        guard let data = data else { return }
//        do {
//            let json = try JSONSerialization.jsonObject(with: data, options: [])
//            print(json)
//        } catch {
//            print(error)
//        }
//    }.resume()
