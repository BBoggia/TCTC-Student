//
//  CoveOrderFormViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 2/15/17.
//  Copyright © 2017 Pinetree Studios. All rights reserved.
//

import UIKit
import MessageUI

class CoveOrderFormViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var lunchSegController: UISegmentedControl!
    @IBOutlet var paymentMethod: UISegmentedControl!
    @IBOutlet var orderField: UITextField!
    @IBAction func lunchSegAction(_ sender: Any) {
    }
    @IBAction func submitButton(_ sender: Any) {
        selectLunch()
        createOrderTemplate(orderName: nameField.text!, foodOrder: orderField.text!)
        emailTemplate(order: orderField.text!)
    }
    
    var name = ""
    var lunchPeriod = ""
    var paymentMethodType = ""
    var order = ""
    var orderTemplate = ""
    
    let mc: MFMailComposeViewController = MFMailComposeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mc.mailComposeDelegate = self
        nameField.delegate = self
        orderField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectLunch() {
        if(lunchSegController.selectedSegmentIndex == 0)
        {
            lunchPeriod = "Lunch A"
        }
        else if(lunchSegController.selectedSegmentIndex == 1)
        {
            lunchPeriod = "Lunch B"
        }
        else if(lunchSegController.selectedSegmentIndex == 2)
        {
            lunchPeriod = "Lunch C"
        }
        
        if(paymentMethod.selectedSegmentIndex == 0)
        {
            paymentMethodType = "Cash"
        }
        else if(paymentMethod.selectedSegmentIndex == 1)
        {
            paymentMethodType = "Credit/Debit"
        }
    }
    
    func createOrderTemplate(orderName: String, foodOrder: String) {
        name = orderName
        order = foodOrder
        orderTemplate = "My name is \(name) \nI am in \(lunchPeriod) \nI am paying with \(paymentMethodType) \nI would like to order \(order)"
        print(orderTemplate)
    }
    
    func emailTemplate(order: String) {
        if nameField.text != "" || orderField.text != "" {
            if MFMailComposeViewController.canSendMail() {
                print("Mail services are available")
                let recipients = ["bb254926@tctchome.com"]
                let title = "Cove Order"
                let message = "\(orderTemplate)"
                
                mc.setToRecipients(recipients)
                mc.setSubject(title)
                mc.setMessageBody(message, isHTML: false)
                
                self.present(mc, animated: true, completion: nil)
                return
            } else if !MFMailComposeViewController.canSendMail() {
                displayMyAlertMessage(title: "Uh-Oh😰", userMessage: "It looks like the mail services are not available, please try again later.")
            } else {
                print(LocalizedError.self)
            }
        } else {
            displayMyAlertMessage(title: "Uh-Oh😰", userMessage: "It looks like you forgot to fill in one of the required fields.")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResult.failed.rawValue:
            print("Failed")
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        controller.dismiss(animated: true, completion: nil)
        
        displayMyAlertMessage(title: "Success 😃", userMessage: "Your order has been sent to The Cove. Please check your email for a confirmation!")
    }
    
    func displayMyAlertMessage(title:String, userMessage:String)
    {
        let myAlert = UIAlertController(title: title, message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
    }

}
