//
//  GuidanceViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 11/4/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit

class GuidanceViewController: UIViewController {
    
    @IBOutlet weak var guidancePhone: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func phoneLaunch(sender: AnyObject) {
        callNumber(phoneNumber: "3308470503", extensionNum: "1005")
    }
    @IBOutlet var bottomText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let theInset = bottomText.bounds.maxY + bottomText.bounds.height + 90
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, theInset, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
