//
//  DetailViewController.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 29/06/19.
//  Copyright © 2019 Rafael Oliveira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbMail: UILabel!
    @IBOutlet weak var lbAgeUser: UILabel!
    @IBOutlet weak var lbAddressUser: UILabel!
    @IBOutlet weak var lbCellUser: UILabel!
    
    var nameUser = String()
    var emailUser = String()
    var ageUser = String()
    var AddressUser = String()
    var cellUser = String()
    var dateBUser = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbName.text = nameUser
        self.lbMail.text = emailUser
        self.lbAgeUser.text = ageUser
        self.lbAddressUser.text = AddressUser
        self.lbCellUser.text = cellUser
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
