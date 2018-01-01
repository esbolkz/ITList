//
//  EmployeeTableViewCell.swift
//  ITList
//
//  Created by Yesbol Kulanbekov on 1/1/18.
//  Copyright © 2018 Yesbol Kulanbekov. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    
    var employee: Employee? { didSet { updateUI() } }
    
    private func updateUI(){
        
        if let employee = employee{
            let imageURL = employee.photoURL
            NetworkService.shared.getImage(with: MyService.downloadImage(url: imageURL),
                                          onCompletion: { (response) in
                                            
                                            
                                            DispatchQueue.main.async {
                                                
                                                self.profileImage.image = UIImage(data: response)
                                                
                                            }
                                            
                                            
            })
            
        }
        
    }
    
    
}
