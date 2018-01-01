//
//  MainTableViewController.swift
//  ITList
//
//  Created by Yesbol Kulanbekov on 12/31/17.
//  Copyright © 2017 Yesbol Kulanbekov. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var employees = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.shared.listEmployees { (employees) in
            self.employees = employees
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        //cell.textLabel?.text = "\(indexPath.row + 1)st Row"
        cell.textLabel?.text = employees[indexPath.row].name + " "
                               + employees[indexPath.row].secondName

        return cell
    }
    


}
