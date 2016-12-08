//
//  GuidanceViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 11/4/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit
import LiquidFloatingActionButton

class GuidanceViewController: UIViewController {
    
    @IBOutlet weak var guidancePhone: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var cells = [LiquidFloatingCell]()      //data source
    var floatingActionButton: LiquidFloatingActionButton!
    
    @IBAction func phoneLaunch(sender: AnyObject) {
        callNumber(phoneNumber: "3308470503", extensionNum: "1005")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 700, 0)
        
        createFloatingButton()
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

    func createFloatingButton() {
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
    }
    
}

extension GuidanceViewController: LiquidFloatingActionButtonDataSource {
    
    func numberOfCells(_ liquidFloatingActionButton: LiquidFloatingActionButton) -> Int {
        
        return cells.count
    }
    
    func cellForIndex(_ index: Int) -> LiquidFloatingCell {
        
        return cells[index]
    }
}

extension GuidanceViewController:LiquidFloatingActionButtonDelegate {
    
    func liquidFloatingActionButton(_ liquidFloatingActionButton: LiquidFloatingActionButton, didSelectItemAtIndex index: Int) {
        
        print("button number \(index) did click")
        self.floatingActionButton.close()
    }
    
    func didTapped(liquidFloatingActionButton: LiquidFloatingActionButton) {
        
    }
}
