//
//  UserDetailViewController.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 01/04/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    var userResult: results?
//    MARK: - IBOutlets
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var birthdayLB: UILabel!
    @IBOutlet weak var mobileLB: UILabel!
    @IBOutlet weak var emailLB: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        guard let firstName = userResult?.name.first else {return}
        guard let lastName = userResult?.name.last else {return}
        guard let mobile = userResult?.phone else {return}
        guard let age = userResult?.dob.age else {return}
        guard let email = userResult?.email else{ return}
        
        nameLb.text = "nome: \(firstName) \(lastName)"
        birthdayLB.text = "idade: \(age) anos"
        mobileLB.text = "Telefone: \(mobile)"
        emailLB.text = "email: \(email)"
        setImage(from: userResult?.picture.large ?? "")
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.userImage.image = image
            }
        }
    }
}
