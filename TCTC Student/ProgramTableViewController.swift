//
//  ProgramTableViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 11/18/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit

class ProgramTableViewController: UITableViewController {
    
    var programList = ["AIR FORCE JR.ROTC", "ANIMAL SCIENCE EQUINE", "ANIMAL SCIENCE/HEALTH & TECH", "ARCHITECTURAL DRAFTING", "AUTO COLLISION TECH", "AUTO SERVICE TECH", "BIOTECHNOLOGY", "COMMUNITY CO-OP", "COMPUTER NETWORKING & SECURITY", "CONSTRUCTION TECH", "COSMETOLOGY", "DENTAL ASSISTING", "ELECTRICAL TECH", "ENGINEERING TECH (PLTW)", "EXERCISE SCIENCE", "HEALTH SCIENCE", "HEATING VENT. & AIR COND.", "HOSPITALITY SERVICES", "HR FABRIC SERVICES", "INTERACTIVE MULTIMEDIA", "JOB TRAINING", "LANDSCAPE & DESIGN TECH", "MANUFACTURING TECH", "MARKETING ED", "PUBLIC SAFETY", "RESTRAUNT SERVICES", "TEACHER ACADEMY: CPTP", "TEACHING ACADEMY: EARLY CHILDHOOD", "VISUAL DESIGN & IMAGING", "WEB DESIGN & APP DEVELOPMENT", "WELDING", "", ""]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return programList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "programList", for: indexPath) as! ProgramTableViewCell
        // Configure the cell...
        
        cell.programTitle.text = programList[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
