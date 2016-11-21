//
//  ProgramTableViewCell.swift
//  TCTC Student
//
//  Created by Branson Boggia on 11/21/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit

class ProgramTableViewCell: UITableViewCell {

    @IBOutlet weak var programTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
