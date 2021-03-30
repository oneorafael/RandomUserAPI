//
//  UserViewController.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 29/03/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import UIKit
class UserViewController: UIViewController {
    let services = Webservices()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        services.getData { (results) in
            guard let user = results else {return}
            print(user)
        }
    }
}
