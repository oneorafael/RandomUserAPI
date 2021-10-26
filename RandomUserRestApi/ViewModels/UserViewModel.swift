//
//  UserViewModel.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 01/04/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import Foundation

struct UserViewModel {
    var result: results
    init(result:results) {
        self.result = result
    }
    var first: String {return result.name.first}
    var last: String {return result.name.last}
    var large: String {return result.picture.large}
    var date: String {return result.dob.date}
    var age: Int {return result.dob.age}
    var phone: String {return result.phone}
    var email:String {return result.email}
}
