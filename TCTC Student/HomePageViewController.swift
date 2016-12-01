//
//  HomePageViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 10/28/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageScroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 400, 0)
        
        self.imageScroller.frame = CGRect(x:0, y:122, width:self.imageScroller.frame.width, height:205)
        let imageScrollerWidth:CGFloat = self.view.frame.width
        let imageScrollerHeight:CGFloat = self.imageScroller.frame.height
        
        let imgOne = UIImageView(frame: CGRect(x:imageScrollerWidth*0, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgOne.image = UIImage(named: "1")
        let imgTwo = UIImageView(frame: CGRect(x:imageScrollerWidth*1, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgTwo.image = UIImage(named: "2")
        let imgThree = UIImageView(frame: CGRect(x:imageScrollerWidth*2, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgThree.image = UIImage(named: "3")
        let imgFour = UIImageView(frame: CGRect(x:imageScrollerWidth*3, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgFour.image = UIImage(named: "4")
        let imgFive = UIImageView(frame: CGRect(x:imageScrollerWidth*4, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgFive.image = UIImage(named: "5")
        let imgSix = UIImageView(frame: CGRect(x:imageScrollerWidth*5, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgSix.image = UIImage(named: "6")
        let imgSeven = UIImageView(frame: CGRect(x:imageScrollerWidth*6, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgSeven.image = UIImage(named: "7")
        let imgEight = UIImageView(frame: CGRect(x:imageScrollerWidth*7, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgEight.image = UIImage(named: "8")
        let imgNine = UIImageView(frame: CGRect(x:imageScrollerWidth*8, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgNine.image = UIImage(named: "9")
        let imgTen = UIImageView(frame: CGRect(x:imageScrollerWidth*9, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgTen.image = UIImage(named: "10")
        let imgEleven = UIImageView(frame: CGRect(x:imageScrollerWidth*10, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgEleven.image = UIImage(named: "11")
        let imgTwelve = UIImageView(frame: CGRect(x:imageScrollerWidth*11, y:imageScrollerWidth*0,width:imageScrollerWidth, height:imageScrollerHeight))
        imgTwelve.image = UIImage(named: "12")
        
        self.imageScroller.addSubview(imgOne)
        self.imageScroller.addSubview(imgTwo)
        self.imageScroller.addSubview(imgThree)
        self.imageScroller.addSubview(imgFour)
        self.imageScroller.addSubview(imgFive)
        self.imageScroller.addSubview(imgSix)
        self.imageScroller.addSubview(imgSeven)
        self.imageScroller.addSubview(imgEight)
        self.imageScroller.addSubview(imgNine)
        self.imageScroller.addSubview(imgTen)
        self.imageScroller.addSubview(imgEleven)
        self.imageScroller.addSubview(imgTwelve)
        
        self.imageScroller.contentSize = CGSize(width:self.view.frame.width * 12, height:self.imageScroller.frame.height)
        self.imageScroller.delegate = self
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveToNextPage (){
        
        let pageWidth:CGFloat = self.view.frame.width
        let maxWidth:CGFloat = pageWidth * 12
        let contentOffset:CGFloat = self.imageScroller.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.imageScroller.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.imageScroller.frame.height), animated: true)
    }
    
}
