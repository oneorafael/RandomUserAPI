//
//  UserDetailsViewController.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 20/10/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import Foundation
import UIKit
class UserDetailsViewController:UIViewController {
//    MARK: - Properties
    
    //close btn
    private lazy var closeBtn:UIButton = {
       let closeBtn = UIButton()
        let _image = UIImage(systemName: "xmark.circle")
        closeBtn.setImage(_image, for: .normal)
        closeBtn.tintColor = .label
        closeBtn.imageView?.contentMode = .scaleAspectFill
        closeBtn.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.addTarget(self, action: #selector(dismissWindow), for: .touchUpInside)
        return closeBtn
    }()
    
    //image
    private lazy var PersonImage: UIImageView = {
        let personIMG = UIImage()
        let PersonImage = UIImageView()
        PersonImage.image = personIMG
        PersonImage.contentMode = .scaleAspectFit
        PersonImage.translatesAutoresizingMaskIntoConstraints = false
        return PersonImage
    }()
    
    // name
    private lazy var nameLabel:UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = ""
        titleLabel.font = UIFont.systemFont(ofSize: 33, weight: .black)
        titleLabel.textColor = .gray
        return titleLabel
    }()
    
    //age
    private lazy var birthdayLabel:UILabel = {
        let birthdayLabel = UILabel()
        birthdayLabel.text = ""
        birthdayLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        birthdayLabel.textColor = .gray
        return birthdayLabel
    }()
    
    //email
    private lazy var emailLabel:UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = ""
        emailLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        emailLabel.textColor = .gray
        return emailLabel
    }()
    
    //phone
    private lazy var phoneLabel:UILabel = {
        let phoneLabel = UILabel()
        phoneLabel.text = "Telefone"
        phoneLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        phoneLabel.textColor = .gray
        return phoneLabel
    }()
    
    //StackView
    private lazy var verticalStack:UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(birthdayLabel)
        verticalStack.addArrangedSubview(emailLabel)
        verticalStack.addArrangedSubview(phoneLabel)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        return verticalStack
    }()
    
    //close view when x button is tapped
    @objc func dismissWindow(){
        self.dismiss(animated: true, completion: nil)
    }
    private var userVM:UserViewModel!
    
//    MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        displayData()
    }
    
//    MARK: - Functions
    
    //add subviews and set constraints
    private func  setupViews() {
        view.addSubview(closeBtn)
        view.addSubview(PersonImage)
        view.addSubview(verticalStack)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            closeBtn.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            closeBtn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            closeBtn.heightAnchor.constraint(equalToConstant: 50),
            PersonImage.topAnchor.constraint(equalTo: closeBtn.bottomAnchor, constant: 10),
            PersonImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            PersonImage.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            PersonImage.heightAnchor.constraint(equalToConstant: 350),
            verticalStack.topAnchor.constraint(equalTo: PersonImage.bottomAnchor, constant: 30),
            verticalStack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        ])
    }

    //get data using webservice class and display
    private func displayData(){
        Webservices().getData { results in
            guard let dataResult = results else {return}
            self.userVM = UserViewModel(result: dataResult)
            DispatchQueue.main.async {
                self.birthdayLabel.text = "\(self.userVM.age) anos"
                self.emailLabel.text = "Email: \(self.userVM.email)"
                self.nameLabel.text = "\(self.userVM.first) \(self.userVM.last)"
                self.phoneLabel.text = "Telefone: \(self.userVM.phone)"
                let picURL = URL(string: self.userVM.large)!
                guard let imageData = try? Data(contentsOf: picURL) else { return }
                let image = UIImage(data: imageData)
                self.PersonImage.image = image
            }
        }
    }
}
