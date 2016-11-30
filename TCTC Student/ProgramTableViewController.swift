//
//  ProgramTableViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 11/18/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit

class ProgramTableViewController: UITableViewController {
    
    var programList = ["AIR FORCE JR.ROTC", "ANIMAL SCIENCE EQUINE", "ANIMAL SCIENCE/HEALTH & TECH", "ARCHITECTURAL DRAFTING", "AUTO COLLISION TECH", "AUTO SERVICE TECH", "BIOTECHNOLOGY", "COMMUNITY CO-OP", "COMPUTER NETWORKING & SECURITY", "CONSTRUCTION TECH", "COSMETOLOGY", "DENTAL ASSISTING", "ELECTRICAL TECH", "ENGINEERING TECH (PLTW)", "EXERCISE SCIENCE", "HEALTH SCIENCE", "HEATING VENT. & AIR COND.", "HOSPITALITY SERVICES", "HR FABRIC SERVICES", "INTERACTIVE MULTIMEDIA", "JOB TRAINING", "LANDSCAPE & DESIGN TECH", "MANUFACTURING TECH", "MARKETING ED", "Power Equipment Mech.", "PUBLIC SAFETY", "RESTAURANT SERVICES", "TEACHER ACADEMY: CPTP", "TEACHING ACADEMY: EARLY CHILDHOOD", "VISUAL DESIGN & IMAGING", "WEB DESIGN & APP DEVELOPMENT", "WELDING", "", ""]
    
    var teacherList = ["Lt Col. John Miller & Kelley Kibbey ", "Lisa Street", "Cathy Billock", "Dave White", "Randy Hess", "Dave Gillies", "Michael Alvetro", "Tony Cheff", "Rhonda Orr", "Josh Peachy", "Annette Austin, Rosayln Gault, Cheryl Cornich, & Barbara Maras", "N/A", "Nathan Burton", "Terri Fleming", "Tiffany Fonagy", "Barb Meyer & Amy Garland-Rusnak", "N/A", "Sharon White & Kelsea O’Brien", "Kathy O’Brien", "Kristofer Doran", "Nancy Jones", "Jake Kakavros & Matt Lukach", "Raul Kemp", "Van Orman", "Michelle Plakosh", "Howard Fraley", "Jim Cerenelli", "Jim Antenucci & Brigitte Gillies", "Nicole Pegg", "Ashley Chilton & Deb Ghindia", "Cindy Hickey", "Michael Pozega", " Robert Olesky"]
    
    var phonenumberList = ["330-847-0503 Ext. 1302", "330-847-0503 Ext. 1312", "330-847-0503 Ext. 1208", "330-847-0503 Ext. 1205", "330-847-0503 Ext. 1308", "330-847-0503 Ext. 1306", "330-847-0503 Ext. N/A", "330-847-0503 Ext. 1107", "330-847-0503 Ext 1424", "330-847-0503 Ext. 1305", "330-847-0503 Ext. 1061/1063/1066/1067", "330-847-0503 Ext. N/A", "330-847-0503 Ext. 1207", "330-847-0503 Ext. 1313", "330-847-0503 Ext. 0503", "330-847-0503 Ext. 1408/1417", "330-847-0503 Ext. N/A", "330-847-0503 Ext. 1418", "330-847-0503 Ext. 1301", "330-847-0503 Ext. 1028", "330-847-0503 Ext. 1107", "330-847-0503 Ext. 1214/1215", "330-847-0503 Ext. 0503", "330-847-0503 Ext. 1027", "330-847-0503 Ext. 1309", "330-847-0503 Ext. 1313", "330-847-0503 Ext. 1103/1104", "330-847-0503 Ext. 1044", "330-847-0503 Ext. 1065", "330-847-0503 Ext. 1064", "330-847-0503 Ext. 1401", "330-847-0503 Ext. 1311", "", ""]
    
    var emailList = ["john.miller@tctchome.com & kelley.kibbey@tctchome.com", "lisa.street@tctchome.com", "cathy.billock@tctchome.com", "dave.white@tctchome.com", "randy.hess@tctchome.com", "dave.gillies@tctchome.com", "michael.alvetro@tctchome.com", "tony.cheff@tctchome.com", "rhonda.orr@tctchome.com", "josh.peachy@tctchome.com", "annette.austin@tctchome.com, rosayln.gault@tctchome.com, cheryl.cornich@tctchome.com, & barbara.maras@tctchome.com", "N/A", "nathan.burton@tctchome.com", "terri.fleming@tctchome.com", "tiffany.fonagy@tctchome.com", "barb.meyer@tctchome.com & amy.rusnak@tctchome.com", "N/A", "sharon.white@tctchome.com & kelsea.obrien@tctchome.com", "kathy.obrien@tctchome.com", "kristofer.doran@tctchome.com", "nancy.jones@tctchome.com", "jake.kakavros@tctchome.com & matt.lukach@tctchome.com", "raul.kemp@tctchome.com", "van.orman@tctchome.com", "michelle.plakosh@tctchome.com", "howard.fraley@tctchome.com", "jim.cerenelli@tctchome.com", "jim.antenucci@tctchome.com & brigitte.gillies@tctchome.com", "nicole.pegg@tctchome.com", "ashley.chilton@tctchome.com & deb.ghindia@tctchome.com", "cindy.hickey@tctchome.com", "michael.pozega@tctchome.com", "robert.olesky@tctchome.com"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "showProgramDetail") {
        
            let DVC = segue.destination as! ProgramDetailViewController
            
            if let indexpath = self.tableView.indexPathForSelectedRow {
            
                let programTitleList = programList[indexpath.row] as String
                DVC.sendData1 = programTitleList
                
                let teacherNameList = teacherList[indexpath.row] as String
                DVC.sendData2 = teacherNameList
                
                let thePhonenumberList = phonenumberList[indexpath.row] as String
                DVC.sendData3 = thePhonenumberList
                
                let theEmailList = emailList[indexpath.row] as String
                DVC.sendData4 = theEmailList
                
            
            }
        }
    }
}























