//
//  UserViewModel.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 30/03/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import Foundation


class UserListViewModel {
    var result = [results]()
    
}
struct UserViewModel {
    var result: results
    var first: String {return result.name.first}
    var last: String {return result.name.last}
    var medium: String {return result.picture.medium}
    var date: String {return result.dob.date}
    var age: Int {return result.dob.age}
}
