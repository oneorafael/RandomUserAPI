//
//  MainViewController.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 20/10/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import Foundation
import UIKit
class MainViewController: UIViewController  {
//    MARK: - Properties
    
    //Icon Image
    private lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(systemName: "person.3.fill")
        iconImage.tintColor = .label
        iconImage.sizeToFit()
        iconImage.contentMode = .scaleAspectFit
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        return iconImage
    }()
    
    //AppTitle
    private lazy var appTitle:UILabel = {
        let appTitle = UILabel()
        appTitle.text = "Gerador de informações pessoais"
        appTitle.numberOfLines = 0
        appTitle.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        appTitle.textColor = .label
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        appTitle.textAlignment = .center
        return appTitle
    }()
    
    //AppSubTitle
    private lazy var appSubTitle:UILabel = {
        let appSubTitle = UILabel()
        appSubTitle.text = "Aplicativo gerador de dados pessoais fakes utilizando a api"
        appSubTitle.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        appSubTitle.textColor = .secondaryLabel
        appSubTitle.translatesAutoresizingMaskIntoConstraints = false
        appSubTitle.numberOfLines = 0
        appSubTitle.textAlignment = .center
        return appSubTitle
    }()
    
    //NextBtn "prosseguir"
    private lazy var nextBtn:UIButton = {
        let nextBtn = UIButton()
        nextBtn.setTitle("Iniciar", for: .normal)
        nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        nextBtn.setTitleColor(.label, for: .normal)
        nextBtn.layer.borderColor = UIColor.black.cgColor
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.cornerRadius = 10
        nextBtn.clipsToBounds = true
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.addTarget(self, action: #selector(displayNextPage), for: .touchUpInside)

        return nextBtn
    }()
    
    @objc func displayNextPage(){
        let vc = UserDetailsViewController()
        self.present(vc, animated: true, completion: nil)
    }

    //StackView
    private lazy var verticalStack:UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.addArrangedSubview(iconImage)
        verticalStack.addArrangedSubview(appTitle)
        verticalStack.addArrangedSubview(appSubTitle)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        return verticalStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(verticalStack)
        view.addSubview(nextBtn)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // vertical Stack
            verticalStack.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            verticalStack.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            // appSubTitle
            appSubTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            appSubTitle.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            // icon Image
            iconImage.heightAnchor.constraint(equalToConstant: 50),
            
            // next Btn
            nextBtn.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
            nextBtn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            nextBtn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        ])
        
    }
    
}
