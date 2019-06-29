//
//  ViewController.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 27/06/19.
//  Copyright © 2019 Rafael Oliveira. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    var items = [UserObject]()
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var ivUser: UIImageView!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbDateB: UILabel!
    var age = ""
    var address = ""
    var cell = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        addDummyData()
    }
    @objc func addDummyData() {
        //call api
        ApiManager.sharedInstance.getRandomUsers { (json:JSON) in
            if let results = json["results"].array { //return json from api
                for entry in results { //save items
                    self.items.append(UserObject(json:entry))
                }
                DispatchQueue.main.async {
                    //populate labels
                    for item in self.items {
                        self.lbName.text = "\(item.first!) \(item.last!)"
                        self.lbEmail.text = "Email: \(item.email!)"
                        self.address = "Endereço: \(item.street!) - \(item.city!) - \(item.state!)"
                        self.lbDateB.text = "Data de nascimento: \(item.dateB!)"
                        self.age = "Idade: \(item.age!)"
                        self.cell = "cell: \(item.cell!)"
                        if let url = NSURL(string: item.pictureURL){
                            if let data = NSData(contentsOf: url as URL) {
                                self.ivUser.image = UIImage(data: data as Data)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func reload(_ sender: UIButton) {
        addDummyData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VCDetail: DetailViewController = segue.destination as! DetailViewController
        VCDetail.nameUser = lbName.text!
        VCDetail.emailUser = lbEmail.text!
        VCDetail.ageUser = age
        VCDetail.AddressUser = address
        VCDetail.cellUser = cell
    }
}

