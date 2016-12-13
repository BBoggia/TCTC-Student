//
//  HomePageViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 10/28/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit
import LiquidFloatingActionButton

class HomePageViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate, XMLParserDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageScroller: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    
    var cells = [LiquidFloatingCell]()      //data source
    var floatingActionButton: LiquidFloatingActionButton!
    
    var parser = XMLParser()
    var feeds = NSMutableArray()
    var item = NSMutableDictionary()
    var titleString = NSMutableString()
    var descString = NSMutableString()
    var link = NSMutableString()
    var element = NSString()
    let url = "http://www.tctchome.com//RSS/Events/114580.rss"
    
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
        
        createFloatingButton()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        feeds = NSMutableArray()
        parser = XMLParser(contentsOf: URL(string: url)!)!
        parser.delegate = self
        parser.shouldResolveExternalEntities = false
        parser.parse()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feeds.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = (feeds.object(at: (indexPath as NSIndexPath).row) as AnyObject).object(forKey: "title") as? String
        cell.detailTextLabel?.text = (feeds.object(at: (indexPath as NSIndexPath).row) as AnyObject).object(forKey: "description") as? String
        
        return cell
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        element = elementName as NSString
        
        if element == "item" {
            item = NSMutableDictionary()
            titleString = NSMutableString()
            descString = NSMutableString()
            link = NSMutableString()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element == "title" {
            titleString.append(string)
        } else if element == "link" {
            link.append(string)
        } else if element == "description" {
            descString.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            item.setObject(titleString, forKey: "title" as NSCopying)
            item.setObject(link, forKey: "link" as NSCopying)
            item.setObject(descString, forKey: "description" as NSCopying)
            
            feeds.add(item.copy())
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        self.tableView.reloadData()
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
    
    func createFloatingButton() {
        cells.append(createButtonCellLink(iconName: "floatingButton1"))
        cells.append(createButtonCellAnnouncements(iconName: "calendar"))
        
        let floatingFrame = CGRect(x: self.view.frame.width - 56 - 16, y: self.view.frame.height - 106 - 16, width: 56, height: 56)
        let floatingButton = createButton(frame: floatingFrame, style: .up)
        
        self.view.addSubview(floatingButton)
        self.floatingActionButton = floatingButton
        
        //floatingActionButton.
    }
    
    private func createButtonCellAnnouncements(iconName: String) -> LiquidFloatingCell {
        return LiquidFloatingCell(icon: UIImage(named: iconName)!)
    }
    
    private func createButtonCellLink(iconName: String) -> LiquidFloatingCell {
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

extension HomePageViewController: LiquidFloatingActionButtonDataSource {
    
    func numberOfCells(_ liquidFloatingActionButton: LiquidFloatingActionButton) -> Int {
        
        return cells.count
    }
    
    func cellForIndex(_ index: Int) -> LiquidFloatingCell {
        
        return cells[index]
    }
}

extension HomePageViewController:LiquidFloatingActionButtonDelegate {
    
    func liquidFloatingActionButton(_ liquidFloatingActionButton: LiquidFloatingActionButton, didSelectItemAtIndex index: Int) {
        
        print("button number \(index) did click")
        self.floatingActionButton.close()
    }
    
    func didTapped(liquidFloatingActionButton: LiquidFloatingActionButton) {
        
    }
}

