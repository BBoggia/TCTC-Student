//
//  SYOTableViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 2/18/17.
//  Copyright © 2017 Pinetree Studios. All rights reserved.
//

import UIKit

class SYOTableViewController: UITableViewController {
    
    var syoList = ["HOSA", "BPA", "DECA", "Educators Rising", "FCCLA", "FFA", "SkillsUSA"]
    var syoUrl = ["http://hosa.org/", "http://www.bpa.org/", "http://www.deca.org/", "https://www.educatorsrising.org/", "http://www.ohiofccla.com/", "http://ohioffa.org/", "http://www.ohioskillsusa.org/"]
    var titleString: String!
    var urlString: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return syoList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SYOCell", for: indexPath)
        
        myCell.textLabel?.text = syoList[indexPath.row]
        
        return myCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        titleString = syoList[indexPath.row]
        urlString = syoUrl[indexPath.row]
        
        self.performSegue(withIdentifier: "fromSYO", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromSYO" {
            var detail: UniversalWebViewController
            
            detail = segue.destination as! UniversalWebViewController
            detail.url = urlString as String
            detail.titleString = titleString! as String
            
        }
    }


}
