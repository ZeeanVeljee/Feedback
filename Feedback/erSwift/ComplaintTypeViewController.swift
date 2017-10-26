//
//  ComplaintTypeViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 20/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

var typeOfComplaint = String()
var categorySelected = String()

class ComplaintTypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem?.title = ""
        // Do any additional setup after loading the view.
        
        
        let button =  UIButton(type: .custom)
        
        button.frame = CGRect(x: 0, y: 0, width: UIScreen.main().bounds.width - 100, height: 64)
        button.backgroundColor = UIColor.clear()
        button.setTitle("", for: UIControlState.selected)
        button.addTarget(self, action: #selector(ComplaintTypeViewController.clickOnButton(button:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.titleView = button
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func miscBtn(_ sender: AnyObject) {
        typeOfComplaint = "Category"
        categorySelected = "Miscellaneous"
        performSegue(withIdentifier: "next", sender: self)
    }
    @IBAction func academicsBtn(_ sender: AnyObject) {
        typeOfComplaint = "Regarding"
        categorySelected = "Academics"
        performSegue(withIdentifier: "next", sender: self)
    }
    @IBAction func buildingsBtn(_ sender: AnyObject) {
        typeOfComplaint = "Building"
        categorySelected = "Buildings"
        performSegue(withIdentifier: "next", sender: self)
    }
    @IBAction func eateriesBtn(_ sender: AnyObject) {
        typeOfComplaint = "Name"
        categorySelected = "Eateries"
        performSegue(withIdentifier: "next", sender: self)
    }
    @IBAction func hostelBtn(_ sender: AnyObject) {
        typeOfComplaint = "Block"
        categorySelected = "Hostel"
        performSegue(withIdentifier: "next", sender: self)
    }
    
    func clickOnButton(button: UIButton) {
        print("OK")
        typeOfComplaint = "Block"
        categorySelected = "Hostel"
        performSegue(withIdentifier: "next", sender: self)
    }

}
