//
//  EmployeeDetailViewController.swift
//  ITList
//
//  Created by Yesbol Kulanbekov on 1/1/18.
//  Copyright © 2018 Yesbol Kulanbekov. All rights reserved.
//

import UIKit
import MessageUI


struct Platform {
    
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
    
}

class EmployeeDetailViewController: UIViewController,MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var ipAddress: UILabel!
    
    
    
    
    var employee : Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        
        if Platform.isSimulator { return }
        guard let employeeUN = employee else { return }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self

        composeVC.setToRecipients([employeeUN.email])
        composeVC.setSubject("Hello There! ")
        composeVC.setMessageBody("Hey \(employeeUN.name)!", isHTML: false)
        
        self.present(composeVC, animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    private func updateUI() {
        
        if let employeeUN = employee {
            
            fullName.text = employeeUN.name + " " + employeeUN.secondName
            gender.text = employeeUN.gender
            ipAddress.text = employeeUN.ipAddress
            email.text = employeeUN.email
            let imageURL = employeeUN.photoURL
            NetworkService.shared.getImage(with: MyService.downloadImage(url: imageURL),
                                           onCompletion: { (response) in
                                            
                                            DispatchQueue.main.async {

                                                self.imageView.image = UIImage(data: response)
                                                
                                            }
                                            
                                            
            })
            
        }
        
        
    }
    
    
    
}
