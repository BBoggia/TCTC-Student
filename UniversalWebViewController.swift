//
//  UniversalWebViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 2/9/17.
//  Copyright © 2017 Pinetree Studios. All rights reserved.
//

import UIKit

class UniversalWebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var url = ""
    var titleString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = titleString
        
        let myURL = URL(string: url .addingPercentEscapes(using: String.Encoding.utf8)!)
        
        let request = URLRequest(url: myURL!)
        
        self.webView.loadRequest(request)
        self.webView.delegate = self
    }
    @IBAction func closeBarButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
