//
//  ViewController.swift
//  fltsum request
//
//  Created by ken petschauer on 5/21/19.
//  Copyright © 2019 ken petschauer. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
    
    var subjectField : String = ""
    
    
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
        enteredFlightNumber.delegate = self
    }
    
    @IBOutlet weak var enteredFlightNumber: UITextField!
    
    
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        let selectedRequest = pickedRequest.selectedRow(inComponent: 0)
        let selectedFlightNumber : String = ""
        
        if selectedRequest == 0 {
            subjectField = "Fltsum "
            //print (subjectField)
        } else if selectedRequest == 1{
            subjectField = "Crew "
            //print (selectedRequest)
            //print ("selected subj field is \(subjectField)")
        } else if selectedRequest == 2 {
            subjectField = "EDCT "
            //print (subjectField)
        } else if selectedRequest == 3 {
            subjectField = "Loads "
            //print (subjectField)
        } else if selectedRequest == 4 {
            subjectField = "Times "
            //print (subjectField)
        }
    
        let selectedFlightNumber : String = enteredFlightNumber.text!
        
        //print ("now we just have to send mail")
        print (selectedFlightNumber)
        //print (subjectField)
        
        sendEmail()
    }
    
    func sendEmail() {
        
        print (selectedFlightNumber)
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["areq@jetblue.com"])
            mail.setSubject("\(subjectField) \(selectedFlightNumber)")
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



