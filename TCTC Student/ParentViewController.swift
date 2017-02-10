//
//  ParentViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 2/6/17.
//  Copyright © 2017 Pinetree Studios. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    var strings:[String] = []
    var titleString: String?
    var urlString = NSString()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bulletLabel: UILabel!
    @IBAction func parentAccessButton(_ sender: Any) {
        titleString = "Parent Access"
        urlString = "https://progressbook.neomin.org/ParentAccess/district/tctc"
        self.performSegue(withIdentifier: "fromParent", sender: self)
    }
    @IBAction func studentFormsButton(_ sender: Any) {
        titleString = "Student Forms"
        urlString = "https://tctcforms.neomin.org/start/"
        self.performSegue(withIdentifier: "fromParent", sender: self)
        print("it works")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 179, 0)
        
        let bullet1 = "Allow parents secure access to view their child’s academic progress of grades and assignments"
        let bullet2 = "Easily view daily attendance, homework, teacher web pages, student schedule and more"
        let bullet3 = "View teacher comments"
        let bullet4 = "Parents have the ability to view all their children’s progress from a single account login"
        let bullet5 = "Easy access to contact information allows parents and teachers to readily communicate"
        
        strings = [bullet1, bullet2, bullet3, bullet4, bullet5]
        
        let attributesDictionary = [NSFontAttributeName : bulletLabel.font]
        let fullAttributedString = NSMutableAttributedString(string: "", attributes: attributesDictionary)
        
        for string: String in strings
        {
            let bulletPoint: String = "\u{2022}"
            let formattedString: String = "\(bulletPoint) \(string)\n"
            let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: formattedString)
            
            let paragraphStyle = createParagraphAttribute()
            attributedString.addAttributes([NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, attributedString.length))
            
            fullAttributedString.append(attributedString)
        }
        
        bulletLabel.attributedText = fullAttributedString
    }
    
    func createParagraphAttribute() ->NSParagraphStyle
    {
        var paragraphStyle: NSMutableParagraphStyle
        paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 15, options: NSDictionary() as! [String : AnyObject])]
        paragraphStyle.defaultTabInterval = 15
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.headIndent = 15
        
        return paragraphStyle
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromParent" {
            var detail: UniversalWebViewController
            
            detail = segue.destination as! UniversalWebViewController
            detail.url = urlString as String
            detail.titleString = titleString! as String
            
        }
    }

}
