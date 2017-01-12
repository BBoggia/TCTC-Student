//
//  EventsViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 1/12/17.
//  Copyright © 2017 Pinetree Studios. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, XMLParserDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var parser = XMLParser()
    var feeds = NSMutableArray()
    var item = NSMutableDictionary()
    var titleString = NSMutableString()
    var descString = NSMutableString()
    var link = NSMutableString()
    var element = NSString()
    let url = "http://www.tctchome.com//RSS/Events/114580.rss"
    
    var theIndex: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        feeds = NSMutableArray()
        parser = XMLParser(contentsOf: URL(string: url)!)!
        parser.delegate = self
        parser.shouldResolveExternalEntities = false
        parser.parse()

        // Do any additional setup after loading the view.
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

}
