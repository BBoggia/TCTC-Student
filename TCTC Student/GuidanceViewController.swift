//
//  GuidanceViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 11/4/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit
import MessageUI

class GuidanceViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var bottomText: UILabel!
    
    @IBAction func secretaryPhone(_ sender: Any) {
        callNumber(phoneNumber: "3308470503", extensionNum: "1005")
    }
    @IBAction func secretaryEmail(_ sender: Any) {
        emailTemplate(recipient: "cindy.goff@tctchome.com")
    }
    @IBAction func lenPhone(_ sender: Any) {
        callNumber(phoneNumber: "3308470503", extensionNum: "1007")
    }
    @IBAction func lenEmail(_ sender: Any) {
        emailTemplate(recipient: "maria.len@tctchome.com")
    }
    @IBAction func hentoshPhone(_ sender: Any) {
        callNumber(phoneNumber: "3308470503", extensionNum: "1006")
    }
    @IBAction func hentoshEmail(_ sender: Any) {
        emailTemplate(recipient: "tina.hentosh@tctchome.com")
    }
    @IBAction func sparacinoPhone(_ sender: Any) {
        callNumber(phoneNumber: "3308470503", extensionNum: "1010")
    }
    @IBAction func sparacinoEmail(_ sender: Any) {
        emailTemplate(recipient: "denise.sparacino@tctchome.com")
    }
    
    let mc: MFMailComposeViewController = MFMailComposeViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let theInset = bottomText.bounds.maxY + bottomText.bounds.height + 90
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, theInset, 0)
        
        mc.mailComposeDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func emailTemplate(recipient: String) {
        let recipients = [recipient]
        let title = "School Counselor"
        let message = ""
        
        mc.setToRecipients(recipients)
        mc.setSubject(title)
        mc.setMessageBody(message, isHTML: false)
        
        self.present(mc, animated: true, completion: nil)
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
    
    private func callNumber(phoneNumber:String, extensionNum:String) {
        if let phoneCallURL:NSURL = NSURL(string: "tel://\(phoneNumber),\(extensionNum)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL as URL)) {
                application.open(phoneCallURL as URL);
            }
        }
    }
}
