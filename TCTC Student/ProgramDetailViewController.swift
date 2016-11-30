//
//  ProgramDetailViewController.swift
//  TCTC Student
//
//  Created by Branson Boggia on 11/30/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit

class ProgramDetailViewController: UIViewController {

    @IBOutlet weak var programImageView: UIImageView!
    @IBOutlet weak var programTitle: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var teacherPhonenumber: UILabel!
    @IBOutlet weak var teacherEmail: UILabel!
    
    var sendData1: String!
    var sendData2: String!
    var sendData3: String!
    var sendData4: String!
    var sendData5: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        programTitle.text = sendData1
        teacherName.text = sendData2
        teacherPhonenumber.text = sendData3
        teacherEmail.text = sendData4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
