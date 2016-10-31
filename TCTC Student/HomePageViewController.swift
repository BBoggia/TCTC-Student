//
//  HomePageViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 10/28/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func WebLink(sender: AnyObject) {
        if let url = NSURL(string: "https://docs.google.com/a/tctchome.com/forms/d/e/1FAIpQLSeJ1bHahcqJBr_A6G_ZC8zcAsPDkwQdFsJNTmthLfcRg4_p6A/viewform") {
            UIApplication.shared.openURL(url as URL)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 400, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
