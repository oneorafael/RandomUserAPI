//
//  ApiManager.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 27/06/19.
//  Copyright © 2019 Rafael Oliveira. All rights reserved.
//

import UIKit
import SwiftyJSON

typealias ServiceResponse = (JSON,Error?) -> Void
class ApiManager: NSObject {
    
    static let sharedInstance = ApiManager()
    let baseUrl = "https://randomuser.me/api/"
    
    //MARK: - func GetRandomUsers
    func getRandomUsers(onCompletion:@escaping (JSON) -> Void){
        let route = baseUrl
        makeHTTPGetRequest(path: route) { (json:JSON, error:Error?) in
            onCompletion(json as JSON)
        }
    }
    
    //MARK: - methods GET & POST
    private func makeHTTPGetRequest(path: String , onCompletion: @escaping ServiceResponse) {
        let request = URLRequest(url: NSURL(string: path)! as URL)
        URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            //test json != nil
            if let jsonData = data {
                do {
                    let json: JSON = try JSON(data: jsonData)
                    onCompletion(json,nil)
                } catch {
                    onCompletion(JSON(),error)
                }
            } else {
                onCompletion(JSON(),error)
            }
        }.resume()
    }
    
    private func makeHTTPPostRequest(path: String, body:[String:AnyObject], onCompletion: @escaping ServiceResponse) {
        var request = URLRequest(url:NSURL(string: path)! as URL)
        request.httpMethod = "POST"
        
        do { //  == Get but add body data
            let jsonBody = try JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
            request.httpBody = jsonBody
            URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
                if let jsonData = data {
                    do {
                        let json:JSON = try JSON(data: jsonData)
                        onCompletion(json,nil)
                    } catch {
                        onCompletion(JSON(),error)
                    }
                } else {
                    onCompletion(JSON(),error)
                }
                }.resume()
        } catch {
            onCompletion(JSON(),nil)
        }
    
    }
}
