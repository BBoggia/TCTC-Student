//
//  RssTableViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 11/8/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController, XMLParserDelegate {
    
    var parser = XMLParser()
    var feeds = NSMutableArray()
    var item = NSMutableDictionary()
    var titleString = NSMutableString()
    var link = NSMutableString()
    var element = NSString()
    let url = "http://www.tctchome.com/RSS/News/114504242206402.rss"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        feeds = NSMutableArray()
        parser = XMLParser(contentsOf: URL(string: url)!)!
        parser.delegate = self
        parser.shouldResolveExternalEntities = false
        parser.parse()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feeds.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = (feeds.object(at: (indexPath as NSIndexPath).row) as AnyObject).object(forKey: "title") as? String
        
        return cell
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        element = elementName as NSString
        
        if element == "item" {
            item = NSMutableDictionary()
            titleString = NSMutableString()
            link = NSMutableString()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element == "title" {
            titleString.append(string)
        } else if element == "link" {
            link.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            item.setObject(titleString, forKey: "title" as NSCopying)
            item.setObject(link, forKey: "link" as NSCopying)
            
            feeds.add(item.copy())
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        self.tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let indexPath: IndexPath
            var detail: DetailViewController
            var urlString = NSString()
            var titleString = NSString()
            
            
            indexPath = tableView.indexPathForSelectedRow!
            
            urlString = (feeds.object(at: (indexPath as NSIndexPath).row) as AnyObject).object(forKey: "link") as! NSString
            titleString = (feeds.object(at: (indexPath as NSIndexPath).row) as AnyObject).object(forKey: "title") as! NSString
            
            detail = segue.destination as! DetailViewController
            detail.url = urlString as String
            detail.titleString = titleString as String
            
        }
    }
}

