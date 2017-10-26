//
//  CustomTextField.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 17/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        //layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha:0.3).CGColor
        attributedPlaceholder = AttributedString(string: placeholder!, attributes: [NSForegroundColorAttributeName : UIColor(red: 1, green: 1, blue: 1, alpha:0.5)])
        
    }


}
