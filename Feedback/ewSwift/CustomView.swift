//
//  CustomView.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 21/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

class CustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override func awakeFromNib() {
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }

}
