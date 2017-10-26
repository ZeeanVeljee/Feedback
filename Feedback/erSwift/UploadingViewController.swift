//
//  UploadingViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 19/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

class UploadingViewController: UIViewController {
    @IBOutlet weak var loading: UIActivityIndicatorView!

    var BASE_REF = FIRDatabase.database().reference()

    var currentTotal = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.startAnimating()
        
        BASE_REF.child("response").observeSingleEvent(of: .value, with: {snapshot in
            
            var i = 0
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    let y = (snap.value(forKey: "total") as! Int) + answers[i]
                    i = i + 1
                    self.currentTotal.append(y)
                    if i == snapshots.count {
                        print(self.currentTotal)
                    }
                }
            }
            
        })
        
        
        for i in 0 ... answers.count {
            BASE_REF.child("response").child("\(i+1)").child("total").setValue(currentTotal[i])
        }
        
        
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

}
