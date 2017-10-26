//
//  ViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 14/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit
import Firebase

var flag = false
var questions = [String]()
var flagForLabel = true
var complainMade = false

class ViewController: UIViewController {

    @IBOutlet weak var complaintAcknowledge: UILabel!
    

    var btnClicked = Bool()
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var feedbackBtn: UIButton!
    
    @IBOutlet weak var formFilledLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        
        
        

        
        hello()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        formFilledLabel.isHidden = flagForLabel
        if complainMade == true {
            UIView.animate(withDuration: 3, animations: { Void in
                //self.complaintAcknowledge.isHidden = false
                }, completion: { Void in
            //self.complaintAcknowledge.isHidden = true
            complainMade = false
            })
            complaintAcknowledge.isHidden = false
            complainMade = false
            delay(3, closure: {
                self.complaintAcknowledge.isHidden = true
            })
        }         
    }
    
    func delay(_ delay:Double, closure:()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.after(when: when, execute: closure)
    }

    func hello() {
        loading.isHidden = false

        loading.startAnimating()
        let BASE_REF = FIRDatabase.database().reference()
        BASE_REF.child("questions").observeSingleEvent(of: .value, with: {snapshot in
            questions.removeAll()
            var i = 0
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    i = i + 1
                    questions.append(snap.value as! String)
                    if i == snapshots.count {
                        print(questions)
                        self.loading.stopAnimating()
                        self.loading.isHidden = true
                        //self.currentQuestion = 0
                        if let m = UserDefaults.standard.value(forKey: "questions") {
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
                    }
                }
            }
            
        })
    }
    
    @IBAction func refresh(_ sender: AnyObject) {
        hello()
        flagForLabel = true
        formFilledLabel.isHidden = flagForLabel
        flag = false
        btnClicked = false
        answers.removeAll()
    }
    @IBAction func feebackClicked(_ sender: AnyObject) {
        btnClicked = true
        if flag == true {
            self.performSegue(withIdentifier: "feedbackShow", sender: nil)
        }
        print("Hello\n\n")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "complaint" {
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func infoPage(_ sender: AnyObject) {
    }

}

