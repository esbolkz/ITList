//
//  Employees.swift
//  ITList
//
//  Created by Yesbol Kulanbekov on 1/1/18.
//  Copyright © 2018 Yesbol Kulanbekov. All rights reserved.
//

import Foundation
import UIKit

struct EmployeesViewModel {
    
    var members = [Employee]()
    
    var rowCount: Int {
        return members.count
    }
    
    let sectionCount = 1

    
    func loadEmployees(onCompletion: @escaping (EmployeesViewModel) -> Void) {
        NetworkService.shared.getData (with: MyService.listAllEmployees){ (response) in
            let employees = response.map { (element) -> Employee in
                let employeeJSON = element.1
                let employee = Employee(json: employeeJSON)!
                return employee
            }
            var newVM = EmployeesViewModel()
            newVM.members = employees
            onCompletion(newVM)
        }
    }
    
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        if let employeeCell = cell as? EmployeeTableViewCell{
            employeeCell.nameLabel.text =  members[row].name + " "
                                         + members[row].secondName
            employeeCell.companyLabel.text = members[row].employment.position
            
            employeeCell.employee = members[row]
        }


        return cell
    }
    

    
}


