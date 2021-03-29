//
//  User.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 29/03/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import Foundation
struct User: Decodable {
    let results: [results]
}

struct results: Decodable {
    let name: name
}

struct name: Decodable {
    let first: String
    let last: String
}

