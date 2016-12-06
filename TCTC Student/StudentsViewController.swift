//
//  StudentsViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 12/2/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit
import LiquidFloatingActionButton

class StudentsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var cells = [LiquidFloatingCell]()
    var floatingActionButton: LiquidFloatingActionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 950, 0)

        createFloatingButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createFloatingButton() {
        cells.append(createButtonCell(iconName: "floatingButton"))
        
        let floatingFrame = CGRect(x: self.view.frame.width - 56 - 16, y: self.view.frame.height - 56 - 16, width: 56, height: 56)
        
        //let floatingButton = createButton(floatingFrame, style: .Up)
    }
    
    private func createButtonCell(iconName: String) -> LiquidFloatingCell {
        return LiquidFloatingCell(icon: UIImage(named: iconName)!)
    }

}
