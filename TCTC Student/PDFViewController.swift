//
//  PDFViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 1/20/17.
//  Copyright © 2017 Pinetree Studios. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController {

    @IBOutlet weak var pdfWebView: UIWebView!
    @IBAction func orderButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "coveMenu", ofType: "pdf")!)
        let request = URLRequest(url: path)
        pdfWebView.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
