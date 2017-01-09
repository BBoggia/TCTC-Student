//
//  SlideOutViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 1/4/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit

class slideOutViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblTableView: UITableView!
    
    var ManuNameArray:Array = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ManuNameArray = ["Cove Menu","Public/Annual Notices","Students of the Month","Student Youth Organization","Career Development","Academics","Contact Us","High Schools That Work","Media Center & Other","Special Needs"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManuNameArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.lblMenuname.text! = ManuNameArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let revealviewcontroller:SWRevealViewController = self.revealViewController()
        
        let cell:MenuCell = tableView.cellForRow(at: indexPath) as! MenuCell
        print(cell.lblMenuname.text!)
        if cell.lblMenuname.text! == "Cove Menu"
        {
            print("Cove Menu Tapped")
        }
        if cell.lblMenuname.text! == "Public/Annual Notices"
        {
            print("Public/Annual Notices Tapped")
        }
        if cell.lblMenuname.text! == "Students of the Month"
        {
            print("Students of the Month Tapped")
        }
        if cell.lblMenuname.text! == "Student Youth Organization"
        {
            print("Student Youth Organization Tapped")
        }
        if cell.lblMenuname.text! == "Career Development"
        {
            print("Career Development Tapped")
        }
        if cell.lblMenuname.text! == "Academics"
        {
            print("Academics Tapped")
        }
        if cell.lblMenuname.text! == "Contact Us"
        {
            print("Contact Us Tapped")
        }
        if cell.lblMenuname.text! == "High Schools That Work"
        {
            print("High Schools That Work Tapped")
        }
        if cell.lblMenuname.text! == "Media Center & Other"
        {
            print("Media Center & Other Tapped")
        }
        if cell.lblMenuname.text! == "Special Needs"
        {
            print("Special Needs Tapped")
        }
    }

    
}
