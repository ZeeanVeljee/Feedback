//
//  InitialViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 22/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkLoggedOnUsers()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func checkLoggedOnUsers() {
        
        let x = UserDefaults.standard.value(forKey: "admin")
        print(x)
        print("\n\n")
        if x == nil {
            print("ADMIN NOT LOGGED ON")
        } else {
            print("ADMIN LOGGED ON")
            /*dispatch_get_main_queue().asynchronously() {
                [unowned self] in
                self.performSegue(withIdentifier: "admin", sender: self)
            }*/
            DispatchQueue.main.async(execute: {
                self.performSegue(withIdentifier: "admin", sender: self)
            })
            //self.performSegue(withIdentifier: "admin", sender: self)
            return
        }
        
        let y =  UserDefaults.standard.value(forKey: "student")
        print(y)
        print("\n\n")
        if y == nil {
            print("STUDENT NOT LOGGED IN")
        } else {
            DispatchQueue.main.async(execute: {
                self.performSegue(withIdentifier: "student", sender: self)
            })
        }
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        if segue.identifier == "admin" {
            //performSegue(withIdentifier: "admin", sender: nil)
        }
        if segue.identifier == "student" {
            //performSegue(withIdentifier: "student", sender: nil)
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
