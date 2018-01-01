//
//  MainTableViewController.swift
//  ITList
//
//  Created by Yesbol Kulanbekov on 12/31/17.
//  Copyright © 2017 Yesbol Kulanbekov. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController{

    var employeesVM = EmployeesViewModel() {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadSections([0], with: .fade)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Google Employees"
        employeesVM.loadEmployees { newVM  in
            self.employeesVM = newVM
        }
    }


    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return employeesVM.sectionCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeesVM.rowCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return employeesVM.cellInstance(tableView,indexPath: indexPath)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let employee: Employee = employeesVM.members[indexPath.row]
        if segue.identifier == "toDetail"{
            if let destinationVC = segue.destination as? EmployeeDetailViewController{
                destinationVC.employee = employee
            }
            
        }
        
    }



}
