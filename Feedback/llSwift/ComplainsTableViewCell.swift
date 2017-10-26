//
//  ComplainsTableViewCell.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 21/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

class ComplainsTableViewCell: UITableViewCell {

    @IBOutlet weak var complaintLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
