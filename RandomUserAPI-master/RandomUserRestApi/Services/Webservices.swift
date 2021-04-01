//
//  Webservices.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 29/03/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import Foundation
class Webservices {
    let path = "https://randomuser.me/api/"
    
    func getData(completion:@escaping([results]?)->()){
        URLSession.shared.dataTask(with: URL(string: path)!) { (data, response, error) in
            guard let data = data else {return}
            let userData = try? JSONDecoder().decode(User.self, from: data)
            completion(userData?.results)
        }.resume()
    }
    
    func fetchImage(urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
        let session = URLSession.shared
        let url = URL(string: urlString)
        guard let path = url else {return}
            
        let dataTask = session.dataTask(with: path) { (data, response, error) in
            if error != nil {
                print("Error fetching the image!")
                completionHandler(nil)
            } else {
                completionHandler(data)
            }
        }
            
        dataTask.resume()
    }
}
