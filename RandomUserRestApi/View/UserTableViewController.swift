//
//  UserTableViewController.swift
//  RandomUserRestApi
//
//  Created by Rafael Oliveira on 30/03/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {

    var userVM = UserListViewModel()
    var services = Webservices()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        var i = 0
        while i <= 4 {
            services.getData { (results) in
                guard let userResults = results else {return}
                print(userResults)
                self.userVM.result.append(contentsOf: userResults)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            i += 1
        }
    }
    
    @IBAction func reloadUsers(_ sender: UIBarButtonItem) {
        self.userVM.result.removeAll()
        setup()
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userVM.result.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = userVM.result[indexPath.row]
        cell.textLabel?.text = "\(user.name.first) \(user.name.last)"
        return cell
    }
    
//    TODO: Passar dado para a view após tocar em uma celula
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
