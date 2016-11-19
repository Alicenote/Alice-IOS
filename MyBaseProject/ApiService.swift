//
//  ApiService.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/14/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class ApiService:NSObject{
    static let sharedInstance = ApiService()
    // POST
    typealias CompletionHandler = (_ data:Data) -> Void
    func requestWithPost(url:String, bodyData:String, completionHandler: @escaping CompletionHandler){
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = bodyData.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completionHandler(Data())
            }
            
            if data == nil {
                completionHandler(Data())
                
            } else {
                completionHandler(data!)
            }
        }
        task.resume()
    }
    
}
