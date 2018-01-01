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
        NetworkService.shared.listEmployees { (employees) in
            var newVM = EmployeesViewModel()
            newVM.members = employees
            onCompletion(newVM)
        }
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        //let section = indexPath.section
        //let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        cell.textLabel?.text = members[indexPath.row].name + " "
                             + members[indexPath.row].secondName
        return cell
    }
    

    
}
