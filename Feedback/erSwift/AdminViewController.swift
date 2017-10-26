//
//  AdminViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 20/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit
import Firebase


var hostel = [Dictionary<String,String>]()
var building = [Dictionary<String,String>]()
var academics = [Dictionary<String,String>]()
var misc = [Dictionary<String,String>]()
var eateries = [Dictionary<String,String>]()
var q = [String]()

class AdminViewController: UIViewController {

    var countOfComplaints = 0
    

    @IBOutlet weak var complaintsLoading: UIActivityIndicatorView!
    @IBOutlet weak var feedbackLoading: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFeedback()
        fetchComplaints()
        fetchQuestions()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchFeedback() {
        x.removeAll()
        feedbackLoading.startAnimating()
        let BASE_REF = FIRDatabase.database().reference()
            BASE_REF.child("response").observeSingleEvent(of: .value, with: {snapshot in
                var i = 0
                if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                    for snap in snapshots {
                        print(snap)
                        
                        let z = (snap.childSnapshot(forPath: "count").value as! Int)
                        let y = (snap.childSnapshot(forPath: "total").value as! Int)
                        if y == 0 || z == 0 {
                            x.append(0)
                        }else {
                            x.append(round(Float(y*10)/Float(z))/10)
                        }
                        i = i + 1
                        if i == snapshots.count {
                            self.fetchQuestions()
                        }
                        
                        //self.BASE_REF.child("response").child("\(i+1)").updateChildValues(["count":z, "total": y])
                        //i = i + 1
                    }
                }
                
            })
    }

    func fetchComplaints(){
        complaintsLoading.startAnimating()
        let BASE_REF = FIRDatabase.database().reference()
        BASE_REF.child("complaints").child("Hostel").observeSingleEvent(of: .value, with: {snapshot in
            var i = 0
            hostel.removeAll()
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    //print(snap)
                    
                    let z = (snap.childSnapshot(forPath: "category").value as! String)
                    let y = (snap.childSnapshot(forPath: "complaint").value as! String)
                    let x :Dictionary<String,String> = ["category": z,
                                                           "complaint": y,]
                    
                    hostel.append(x)
                    
                    i = i + 1
                    if i == snapshots.count {
                        self.check()
                        //print(hostel)
                        //self.complaintsLoading.stopAnimating()
                    }
                    
                    //self.BASE_REF.child("response").child("\(i+1)").updateChildValues(["count":z, "total": y])
                    //i = i + 1
                }
            }
            
        })
        
        BASE_REF.child("complaints").child("Buildings").observeSingleEvent(of: .value, with: {snapshot in
            var i = 0
            building.removeAll()
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    //print(snap)
                    
                    let z = (snap.childSnapshot(forPath: "category").value as! String)
                    let y = (snap.childSnapshot(forPath: "complaint").value as! String)
                    let x :Dictionary<String,String> = ["category": z,
                                                        "complaint": y,]
                    
                    building.append(x)
                    
                    i = i + 1
                    if i == snapshots.count {
                        self.check()
                        //print(hostel)
                        //self.complaintsLoading.stopAnimating()
                    }
                    
                    //self.BASE_REF.child("response").child("\(i+1)").updateChildValues(["count":z, "total": y])
                    //i = i + 1
                }
            }
            
        })


        BASE_REF.child("complaints").child("Academics").observeSingleEvent(of: .value, with: {snapshot in
            var i = 0
            academics.removeAll()
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    //print(snap)
                    
                    let z = (snap.childSnapshot(forPath: "category").value as! String)
                    let y = (snap.childSnapshot(forPath: "complaint").value as! String)
                    let x :Dictionary<String,String> = ["category": z,
                                                        "complaint": y,]
                    
                    academics.append(x)
                    
                    i = i + 1
                    if i == snapshots.count {
                        self.check()
                        //print(hostel)
                        //self.complaintsLoading.stopAnimating()
                    }
                    
                    //self.BASE_REF.child("response").child("\(i+1)").updateChildValues(["count":z, "total": y])
                    //i = i + 1
                }
            }
            
        })

        
        BASE_REF.child("complaints").child("Eateries").observeSingleEvent(of: .value, with: {snapshot in
            var i = 0
            eateries.removeAll()
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    //print(snap)
                    
                    let z = (snap.childSnapshot(forPath: "category").value as! String)
                    let y = (snap.childSnapshot(forPath: "complaint").value as! String)
                    let x :Dictionary<String,String> = ["category": z,
                                                        "complaint": y,]
                    
                    eateries.append(x)
                    
                    i = i + 1
                    if i == snapshots.count {
                        self.check()
                        //print(hostel)
                        //self.complaintsLoading.stopAnimating()
                    }
                    
                    //self.BASE_REF.child("response").child("\(i+1)").updateChildValues(["count":z, "total": y])
                    //i = i + 1
                }
            }
            
        })

        
        BASE_REF.child("complaints").child("Miscellaneous").observeSingleEvent(of: .value, with: {snapshot in
            var i = 0
            misc.removeAll()
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    print(snap)
                    
                    let z = (snap.childSnapshot(forPath: "category").value as! String)
                    let y = (snap.childSnapshot(forPath: "complaint").value as! String)
                    let x :Dictionary<String,String> = ["category": z,
                                                        "complaint": y,]
                    
                    misc.append(x)
                    
                    i = i + 1
                    if i == snapshots.count {
                        self.check()
                        //print(hostel)
                        //self.complaintsLoading.stopAnimating()
                        print(misc)
                    }
                    
                    //self.BASE_REF.child("response").child("\(i+1)").updateChildValues(["count":z, "total": y])
                    //i = i + 1
                }
            }
            
        })

        
        
    }
    
    func fetchQuestions() {
        let BASE_REF = FIRDatabase.database().reference()
        BASE_REF.child("questions").observeSingleEvent(of: .value, with: {snapshot in
            q.removeAll()
            var i = 0
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    i = i + 1
                    q.append(snap.value as! String)
                    if i == snapshots.count {
                        print(q)
                        self.feedbackLoading.stopAnimating()
                        //self.loading.stopAnimating()
                        //self.loading.isHidden = true
                        //self.currentQuestion = 0
                        /*if let m = UserDefaults.standard().value(forKey: "questions") {
                            if m as! Array<String> == questions {
                                //self.navigationController?.popToRootViewController(animated: true)
                                self.formFilledLabel.isHidden = false
                                self.feedbackBtn.isUserInteractionEnabled = false
                                
                                
                            } else {
                                
                                if self.btnClicked  == true {
                                    self.performSegue(withIdentifier: "feedbackShow", sender: nil)
                                }
                                self.feedbackBtn.isUserInteractionEnabled = true
                                flag = true
                            }
                            
                        } else {
                            if self.btnClicked  == true {
                                self.performSegue(withIdentifier: "feedbackShow", sender: nil)
                            }
                            self.feedbackBtn.isUserInteractionEnabled = true
                            flag = true
                            
                        }
                        
                        //self.nextQuestion()
                    }*/
                }
            }
            
            }})

    }
    
    @IBAction func refresh(_ sender: AnyObject) {
        countOfComplaints = 0
        fetchFeedback()
        fetchComplaints()
    }
    
    func check() {
        countOfComplaints = countOfComplaints + 1
        print(countOfComplaints)
        if countOfComplaints == 5 {
            
            self.complaintsLoading.stopAnimating()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        //if segue.identifier == "complaint" {
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        //}
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
