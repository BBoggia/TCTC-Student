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
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 400, 0)
        
        self.imageScroller.frame = CGRect(x:0, y:112, width:self.imageScroller.frame.width, height:250)
        let imageScrollerWidth:CGFloat = self.imageScroller.frame.width
        let imageScrollerHeight:CGFloat = self.imageScroller.frame.height
        
        let imgOne = UIImageView(frame: CGRect(x:imageScrollerWidth*0, y:self.imageScroller.frame.minY,width:imageScrollerWidth, height:imageScrollerHeight))
        imgOne.image = UIImage(named: "Screen Shot 2016-10-24 at 12.44.07 PM")
        let imgTwo = UIImageView(frame: CGRect(x:imageScrollerWidth*1, y:self.imageScroller.frame.minY,width:imageScrollerWidth, height:imageScrollerHeight))
        imgTwo.image = UIImage(named: "logo")
        let imgThree = UIImageView(frame: CGRect(x:imageScrollerWidth*2, y:self.imageScroller.frame.minY,width:imageScrollerWidth, height:imageScrollerHeight))
        imgThree.image = UIImage(named: "Slide 3")
        let imgFour = UIImageView(frame: CGRect(x:imageScrollerWidth*3, y:self.imageScroller.frame.minY,width:imageScrollerWidth, height:imageScrollerHeight))
        imgFour.image = UIImage(named: "Slide 4")
        
        self.imageScroller.addSubview(imgOne)
        self.imageScroller.addSubview(imgTwo)
        self.imageScroller.addSubview(imgThree)
        self.imageScroller.addSubview(imgFour)
        
        self.imageScroller.contentSize = CGSize(width:self.scrollView.frame.width * 4, height:self.scrollView.frame.height)
        self.imageScroller.delegate = self
        self.pageControl.currentPage = 0
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveToNextPage (){
        
        let pageWidth:CGFloat = self.scrollView.frame.width
        let maxWidth:CGFloat = pageWidth * 4
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.imageScroller.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.imageScroller.frame.height), animated: true)
    }
    
}
