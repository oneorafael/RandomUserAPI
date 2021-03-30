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
    let email: String
    let dob: dob
    let phone: String
    let picture: picture
}

struct name: Decodable {
    let first: String
    let last: String
}

struct dob: Decodable {
    let date: String
    let age: Int
}

struct picture: Decodable {
    let medium: String
}

