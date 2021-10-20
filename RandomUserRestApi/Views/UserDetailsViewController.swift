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
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            closeBtn.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            closeBtn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            closeBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
