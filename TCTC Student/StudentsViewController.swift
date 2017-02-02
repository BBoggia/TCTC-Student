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

    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func videoButton(_ sender: Any) {
        playVideo()
    }
    
/*    var cells = [LiquidFloatingCell]()      //data source
    var floatingActionButton: LiquidFloatingActionButton!*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 650, 0)

        //createFloatingButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playVideo() {
        
        let videoURL = NSURL(string: "http://www.tctchome.com/VideoUp/3f900c6b-4454-4350-aedf-2bb7b9be31d1.mp4.mp4")
        let player = AVPlayer(url: videoURL! as URL)
        let playerViewController = AVViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
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













