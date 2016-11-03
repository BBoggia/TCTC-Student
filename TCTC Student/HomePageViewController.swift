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

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 400, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
