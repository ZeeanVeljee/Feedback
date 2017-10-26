//
//  AdminLoginViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 22/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

class AdminLoginViewController: UIViewController {

    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func login(_ sender: AnyObject) {
        if usernameLabel.text == "admin" && passwordLabel.text == "12345" {
            performSegue(withIdentifier: "loggedIn", sender: nil)
            UserDefaults.standard.set(true, forKey: "admin")
        } else {
            print("INCORRECT")
            UserDefaults.standard.removeObject(forKey: "admin")
        }
        let x = UserDefaults.standard.value(forKey: "admin")
        print(x)
        print("\n\n")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
