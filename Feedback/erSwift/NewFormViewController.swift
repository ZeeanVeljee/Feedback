//
//  NewFormViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 22/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

class NewFormViewController: UIViewController {

    @IBOutlet weak var questionTF: UITextField!
    var newQuestions = [String]()
    
    //@IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    //var keyboardHeight = CGFloat()
    
    //@IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestions.removeAll()
        self.title = "1"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.white()
        ]
        //tableView.keyboardDismissMode = .onDrag
        
        //NotificationCenter.default().addObserver(self, selector: #selector(NewFormViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        //NotificationCenter.default().addObserver(self, selector: #selector(NewFormViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostFormTableViewCell
        cell.questionLabel.text = "\(indexPath.row + 1)"
        cell.questionTextField.text = newQuestions[indexPath.row]
        
        return cell
        
        
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /*override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        txtField.resignFirstResponder()
        self.view.endEditing(true)
    }*/
    
    /*
    func keyboardWillShow(_ notification:Notification) {
        let userInfo:NSDictionary = (notification as NSNotification).userInfo!
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue()
        keyboardHeight = keyboardRectangle.height
        //duration = userInfo.object(forKey: UIKeyboardAnimationDurationUserInfoKey) as! TimeInterval
        self.bottomConstraint.constant += (keyboardHeight - 52)
        //UIView.animate(withDuration: duration, animations: {Void in
            
        //})
    }
    
    */
    
    /*func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        
        view.endEditing(true)
    }*/
    
    /*func keyboardWillHide(_ notification: Notification) {
        //UIView.animate(withDuration: duration, animations: {Void in
            
            self.bottomConstraint.constant = 8
            
        //})
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostFormTableViewCell
        newQuestions[indexPath.row] = cell.questionTextField.text!
    }*/
    @IBAction func next(_ sender: AnyObject) {
        if questionTF.text != "" {
            newQuestions.append(questionTF.text!)
            questionTF.text = ""
            self.title = "\(newQuestions.count+1)"
        }
    }

    @IBAction func completed(_ sender:  AnyObject) {
        print(newQuestions.count)
        if questionTF.text != "" {
            newQuestions.append(questionTF.text!)
            questionTF.text = ""
            self.title = "\(newQuestions.count+1)"
        }
        if newQuestions.count != 0 {
            upload()
            self.navigationController?.popViewController(animated: true)
        }
    }
    func upload() {
        let BASE_REF = FIRDatabase.database().reference()
        
        BASE_REF.child("questions").removeValue { (error, ref) in
            var i = 0
            for _ in self.newQuestions {
                BASE_REF.child("questions").child("\(i+1)").setValue(self.newQuestions[i])
                i = i + 1
            }
        }
        BASE_REF.child("response").removeValue { (error, ref) in
         var i = 0
            for _ in self.newQuestions {
                //BASE_REF.child("response").child("\(i+1)").updateChildValues(["count":0, "total": 0])
                BASE_REF.child("response").child("\(i+1)").child("count").setValue(0)//setValuesForKeys(["count":0, "total": 0])
                BASE_REF.child("response").child("\(i+1)").child("total").setValue(0)
                i = i + 1
                
            }
            
            
        }
        
       /* BASE_REF.child("questions").observeSingleEvent(of: .value, with: {snapshot in
            
            var i = 0
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    print(snap)
                    BASE_REF.child("questions").child("\(i+1)").setValue(self.newQuestions[i])
                    BASE_REF.child("response").child("\(i+1)").updateChildValues(["count":0, "total": 0])
                    i = i + 1
                }
            }
 
        })*/

    }

}
