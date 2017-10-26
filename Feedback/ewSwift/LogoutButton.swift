//
//  LogoutButton.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 22/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

class LogoutButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.white().cgColor
    }
    
}
