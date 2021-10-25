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
    private lazy var PersonImage: UIImageView = {
        let personIMG = UIImage(named: "edgar")
        let PersonImage = UIImageView()
        PersonImage.image = personIMG
        PersonImage.contentMode = .scaleAspectFit
        PersonImage.translatesAutoresizingMaskIntoConstraints = false
//        PersonImage.layer.cornerRadius = 50
//        PersonImage.clipsToBounds = true
        return PersonImage
    }()
    
    private lazy var titleLabel:UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Edgar"
        titleLabel.font = UIFont.systemFont(ofSize: 33, weight: .black)
        titleLabel.textColor = .gray
        return titleLabel
    }()
    private lazy var birthdayLabel:UILabel = {
        let birthdayLabel = UILabel()
        birthdayLabel.text = "data de nascimento"
        birthdayLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        birthdayLabel.textColor = .gray
        return birthdayLabel
    }()
    private lazy var emailLabel:UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        emailLabel.textColor = .gray
        return emailLabel
    }()
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
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(birthdayLabel)
        verticalStack.addArrangedSubview(emailLabel)
        verticalStack.addArrangedSubview(phoneLabel)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        return verticalStack
    }()
    @objc func dismissWindow(){
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
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
}
