//
//  StudentsViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 12/2/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
//import LiquidFloatingActionButton

class StudentsViewController: UIViewController {

    var titleString: String?
    var urlString = NSString()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var wv: UIWebView!
    
    @IBAction func registerCareerDay(_ sender: Any) {
        //Change when students can signup again next year
        //titleString = ""
        //urlString = ""
        //self.performSegue(withIdentifier: "fromStudents", sender: self)
        displayMyAlertMessage(title: "Oops", userMessage: "It looks like you missed TCTC's Career Day 😥. Check back later for next years dates.")
    }
    @IBAction func dentalAssistance(_ sender: Any) {
        titleString = "Dental Assisting"
        urlString = "http://www.tctchome.com/DentalAssisting.aspx"
        self.performSegue(withIdentifier: "fromStudents", sender: self)
    }
    @IBAction func hVAC(_ sender: Any) {
        titleString = "HVAC"
        urlString = "http://www.tctchome.com/HeatingVentilationAirConditioningRefrigeration.aspx"
        self.performSegue(withIdentifier: "fromStudents", sender: self)
    }
    @IBAction func eMTBasic(_ sender: Any) {
        titleString = "EMT Basic"
        urlString = "http://www.tctchome.com/Downloads/1EMTBasic.pdf"
        self.performSegue(withIdentifier: "fromStudents", sender: self)
    }
    @IBAction func nailTech(_ sender: Any) {
        titleString = "Nail Technition"
        urlString = "http://www.tctchome.com/Downloads/NailTech2.pdf"
        self.performSegue(withIdentifier: "fromStudents", sender: self)
    }
    @IBAction func ccpRegister(_ sender: Any) {
        titleString = "College Credit Plus"
        urlString = "https://www.ohiohighered.org/content/college_credit_plus_info_students_families"
        self.performSegue(withIdentifier: "fromStudents", sender: self)
    }
    
/*    var cells = [LiquidFloatingCell]()      //data source
    var floatingActionButton: LiquidFloatingActionButton!*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadYoutube(videoID: "jFrS2gulSXc")
        
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 265, 0)

        //createFloatingButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadYoutube(videoID:String) {
        guard
            let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        wv.loadRequest( URLRequest(url: youtubeURL) )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromStudents" {
            var detail: UniversalWebViewController
            
            detail = segue.destination as! UniversalWebViewController
            detail.url = urlString as String
            detail.titleString = titleString! as String
            
        }
    }
    
    func displayMyAlertMessage(title:String, userMessage:String)
    {
        let myAlert = UIAlertController(title: title, message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    /*func createFloatingButton() {
        cells.append(createButtonCell(iconName: "floatingButton1"))
        
        let floatingFrame = CGRect(x: self.view.frame.width - 56 - 16, y: self.view.frame.height - 106 - 16, width: 56, height: 56)
        let floatingButton = createButton(frame: floatingFrame, style: .up)
        
        self.view.addSubview(floatingButton)
        self.floatingActionButton = floatingButton
        
        //floatingActionButton.
    }
    
    private func createButtonCell(iconName: String) -> LiquidFloatingCell {
        return LiquidFloatingCell(icon: UIImage(named: iconName)!)
    }
    
    private func createButton(frame: CGRect, style: LiquidFloatingActionButtonAnimateStyle) -> LiquidFloatingActionButton {
        
        let floatingActionButton = LiquidFloatingActionButton(frame: frame)
        
        floatingActionButton.animateStyle = style
        floatingActionButton.dataSource = self
        floatingActionButton.delegate = self
        
        
        return floatingActionButton
    }*/

}

/*extension StudentsViewController: LiquidFloatingActionButtonDataSource {

    func numberOfCells(_ liquidFloatingActionButton: LiquidFloatingActionButton) -> Int {
    
        return cells.count
    }
    
    func cellForIndex(_ index: Int) -> LiquidFloatingCell {
    
        return cells[index]
    }
}

extension StudentsViewController:LiquidFloatingActionButtonDelegate {
    
    func liquidFloatingActionButton(_ liquidFloatingActionButton: LiquidFloatingActionButton, didSelectItemAtIndex index: Int) {
    
        print("button number \(index) did click")
        self.floatingActionButton.close()
    }
    
    func didTapped(liquidFloatingActionButton: LiquidFloatingActionButton) {
        
    }
}*/













