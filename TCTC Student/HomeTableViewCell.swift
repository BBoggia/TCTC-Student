//
//  HomeTableViewCell.swift
//  TCTC Student
//
//  Created by Branson Boggia on 12/12/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var event: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
