//
//  ComplaintsNEWTableViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 22/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

class ComplaintsNEWTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var y = [Dictionary<String, String>]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.clipsToBounds = true
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 300
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        if typeOfComplaint == "Block" {
            
            self.title = "Hostel"
        } else if typeOfComplaint == "Name" {
            self.title = "Eateries"
        } else if typeOfComplaint == "Regarding" {
            self.title = "Academics"
        } else if typeOfComplaint == "Category" {
            self.title = "Miscellaneous"
        } else {
            self.title = "Buildings"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if typeOfComplaint == "Block" {
            y = hostel
            return hostel.count
        } else if typeOfComplaint == "Name" {
            y = eateries
            return eateries.count
        } else if typeOfComplaint == "Regarding" {
            y = academics
            return academics.count
        } else if typeOfComplaint == "Category" {
            y = misc
            return misc.count
        } else {
            y = building
            return building.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ComplainsTableViewCell
        
        
        cell.complaintLabel.text = y[indexPath.row]["complaint"]
        cell.categoryLabel.text = y[indexPath.row]["category"]
        
        // Configure the cell...
        
        return cell
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
