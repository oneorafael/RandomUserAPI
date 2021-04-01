//
//  Webservices.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 01/04/21.
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
}
