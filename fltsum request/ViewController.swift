//
//  ViewController.swift
//  fltsum request
//
//  Created by ken petschauer on 5/21/19.
//  Copyright © 2019 ken petschauer. All rights reserved.
//

import UIKit
import MessageUI

//var selectedFlightNumber : String = ""
   // var jbEmail = "test"
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
        
        //below is for using the userpreferences from the settings
        UserDefaults.standard.register(defaults: [String : Any]())
        //let userDefaults = UserDefaults.standard
        //var jbEmail = userDefaults.string(forKey: "JBemail_preference")
    }
    
    
    @IBOutlet weak var enteredFlightNumber: UITextField!
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        let selectedRequest = pickedRequest.selectedRow(inComponent: 0)
        //var selectedFlightNumber : String
        
        if selectedRequest == 0 {
            subjectField = "Fltsum "
            //print (subjectField)
        } else if selectedRequest == 1{
            subjectField = "Crew "
            //print (subjectField)
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
    
        // selectedFlightNumber = enteredFlightNumber.text!
        
        //print ("now we just have to send mail")
        //print (selectedFlightNumber)
        //print (subjectField)
        //print (jbEmail!)
        
        sendEmail()
    }
  
    func sendEmail() {
        
        let userDefaults = UserDefaults.standard
        let jbEmail = userDefaults.string(forKey: "JBemail_preference")!
        
        //print (selectedFlightNumber)
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["areq@jetblue.com"])
            mail.setSubject("\(subjectField)\(enteredFlightNumber.text!)")
        //mail.setPreferredSendingEmailAddress("Kenneth.Petschauer@jetblue.com")
            mail.setPreferredSendingEmailAddress(jbEmail)
            
            present(mail, animated: true)
            
        } else {
            //show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        }
    
    }



