//
//  LoginViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 16/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
     

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginActionButton(_ sender: AnyObject) {
        
        let x = emailTextField.text
        let y = passwordTextField.text
        if x?.contains("@vit.ac.in") == true {
            
        } else {
            print("\n\nENTER A VIT EMAIL ID\n\n")
        }
        if y != "" {
            
        } else {
            print("PASSWORD FIELD CANNOT BE NULL")
        }
        
    }


}
