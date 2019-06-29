//
//  UserObject.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 28/06/19.
//  Copyright © 2019 Rafael Oliveira. All rights reserved.
//

import SwiftyJSON

class UserObject {
    //person data
    var first: String!
    var last: String!
    var pictureURL: String!
    var email: String!
    var age: String!
    var dateB:String!
    var cell:String!
    
    //Address data
    var street: String!
    var city: String!
    var state: String!
    
    required init(json:JSON) {
        first = json["name"]["first"].stringValue
        last = json["name"]["last"].stringValue
        pictureURL = json["picture"]["large"].stringValue
        email = json["email"].stringValue
        age = json["dob"]["age"].stringValue
        street = json["location"]["street"].stringValue
        city = json["location"]["city"].stringValue
        state = json["location"]["state"].stringValue
        dateB = json["dob"]["date"].stringValue
        cell = json["cell"].stringValue
    }
}
