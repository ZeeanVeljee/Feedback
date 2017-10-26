//
//  ComplaintViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 20/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

class ComplaintViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var categoryText: CustomTextField!
    var BASE_REF = FIRDatabase.database().reference()
    @IBOutlet weak var complaintText: CustomTextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = categorySelected
        label.text = typeOfComplaint
        
        self.navigationItem.backBarButtonItem?.title = ""
        
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.white()
        ]
        if typeOfComplaint == "Block" {
            categoryText.placeholder = "D - 304, D Block"
        } else if typeOfComplaint == "Name" {
            categoryText.placeholder = "Food Court, Food Park"
        } else if typeOfComplaint == "Regarding" {
            categoryText.placeholder = "FFCS, Faculty Name, Subject Code"
        } else if typeOfComplaint == "Category" {
            categoryText.placeholder = "Indoor Gym, Main Gate"
        } else {
            categoryText.placeholder = "SJT, TT, SMV"
        }
        categoryText.attributedPlaceholder = AttributedString(string: categoryText.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor(red: 1, green: 1, blue: 1, alpha:0.5)])
        // Do any additional setup after loading the view.
        //NotificationCenter.default().addObserver(self, selector: Selector(("keyboardWillShow:")), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ComplaintViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MA RK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func complaintSubmit(_ sender: AnyObject) {
        
        if categoryText.text == "" || complaintText.text == "" {
            print("NULL FIELD")
            return
        }
        BASE_REF.child("complaints").child(categorySelected).childByAutoId().updateChildValues(["complaint": complaintText.text,"category":categoryText.text!])
        complainMade = true
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    func keyboardWillShow(notification:NSNotification) {
        print(notification)
        
        
        
        let userInfo:NSDictionary = notification.userInfo!
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue()
        let keyboardHeight = keyboardRectangle.height
        //duration = userInfo.objectForKey(UIKeyboardAnimationDurationUserInfoKey) as! NSTimeInterval
        //curve = userInfo.objectForKey(UIKeyboardAnimationCurveUserInfoKey) as! UInt
        self.bottomConstraint.constant = 8 + keyboardHeight
        
    }

}
