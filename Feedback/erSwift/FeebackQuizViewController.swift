//
//  FeebackQuizViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 18/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit
import Firebase

var answers = [Int]()

class FeebackQuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: CustomLabel!
    
    //var currentTotal = [Int]()
    //var currentCount = [Int]()

    
    var currentQuestion = Int()
    @IBOutlet var answerButton: [UIButton]!
    var BASE_REF = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //currentCount.removeAll()
        //currentTotal.removeAll()
        
        /*BASE_REF.child("questions").observeSingleEvent(of: .value, with: {snapshot in
            self.questions.removeAll()
            var i = 0
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    i = i + 1
                    self.questions.append(snap.value as! String)
                    if i == snapshots.count {
                        print(self.questions)
                        self.currentQuestion = 0
                        if let m = UserDefaults.standard().value(forKey: "questions") {
                            if m as! Array<String> == self.questions {
                                self.navigationController?.popToRootViewController(animated: true)
                            }

                        }
                        
                        self.nextQuestion()
                    }
                }
            }
        
        })*/
        self.currentQuestion = answers.count
        self.nextQuestion()
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
    
    func nextQuestion() {
        if currentQuestion == questions.count {
            print("DONE")
            print(answers)
            UserDefaults.standard.set(questions, forKey: "questions")
            upload()
            return
        }
        questionLabel.text = questions[currentQuestion]
        currentQuestion = currentQuestion + 1
    }
    
    func upload() {
        BASE_REF.child("response").observeSingleEvent(of: .value, with: {snapshot in
            
            var i = 0
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    print(snap)
                    let z = (snap.childSnapshot(forPath: "count").value as! Int) + 1
                    let y = (snap.childSnapshot(forPath: "total").value as! Int) + answers[i]
                    self.BASE_REF.child("response").child("\(i+1)").updateChildValues(["count":z, "total": y])
                    i = i + 1
                    //self.currentCount.append(z)
                    //self.currentTotal.append(y)
                    //if i == snapshots.count {
                        //print(self.currentTotal)
                        //i = 0
                        //for _ in (answers) {
                            //BASE_REF.child("response").child("\(i+1)").child("total").setValue(currentTotal[i])
                            //self.BASE_REF.child("response").child("\(i+1)").updateChildValues(["count":self.currentCount[i], "total": self.currentTotal[i]])
                            //i = i + 1
                        //}

                    //}
                }
            }
            
        })
        
        flag = false
        flagForLabel = false
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    @IBAction func button1(_ sender: AnyObject) {
        answers.append(5)
        nextQuestion()
    }

    @IBAction func button2(_ sender: AnyObject) {
        answers.append(4)
        nextQuestion()
    }
    
    @IBAction func button3(_ sender: AnyObject) {
        answers.append(3)
        nextQuestion()
    }
    
    @IBAction func button4(_ sender: AnyObject) {
        answers.append(2)
        nextQuestion()
    }
    
    @IBAction func button5(_ sender: AnyObject) {
        answers.append(1)
        nextQuestion()
    }
    
}
