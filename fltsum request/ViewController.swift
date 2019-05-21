//
//  ViewController.swift
//  fltsum request
//
//  Created by ken petschauer on 5/21/19.
//  Copyright © 2019 ken petschauer. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendEmail(_ sender: Any) {
        
        sendEmail()
        
        }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["kencfii@aol.com"])
            mail.setSubject("fltsum ")
            mail.setPreferredSendingEmailAddress("Kenneth.Petschauer@jetblue.com")
            
            present(mail, animated: true)
            

        } else {
            //show failure alert
        }
    
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            
            controller.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    
}

