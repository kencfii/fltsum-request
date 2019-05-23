//
//  ViewController.swift
//  fltsum request
//
//  Created by ken petschauer on 5/21/19.
//  Copyright © 2019 ken petschauer. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }

    @IBOutlet weak var pickedRequest: UIPickerView!
    
    var pickerData: [String] = ["Fltsum", "Crew", "EDCT", "Loads", "Times"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Connect to the delagates added above viewsourcedtata picker view delegate
        pickedRequest.delegate = self
        pickedRequest.dataSource = self
    }
    
    // sendEmail()
    
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["areq@jetblue.com"])
            mail.setSubject("fltsum ")
            mail.setPreferredSendingEmailAddress("Kenneth.Petschauer@jetblue.com")
            
            present(mail, animated: true)
            
        } else {
            //show failure alert
        }
            
        }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    }



