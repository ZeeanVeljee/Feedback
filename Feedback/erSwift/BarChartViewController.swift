//
//  BarChartViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 21/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

var x = [Float]()

class BarChartViewController: UIViewController {

    @IBOutlet var questionDescription: [UILabel]!
    @IBOutlet var averageLabel: [UILabel]!
    @IBOutlet var trailingConstraint: [NSLayoutConstraint]!
    
    //let x = [5,5,3,2,3,4,2,1,1,5]
    
    @IBOutlet var barChart: [UIView]!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        hello()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hello() {
        
        
        var j = 0
        print(x.count)
        print(x)
        
        for _ in 0 ... x.count - 1 {
            barChart[j].isHidden = false
            questionDescription[j].text = q[j]
            print(j)
            self.averageLabel[j].text = "\(x[j])"
            self.trailingConstraint[j].constant = CGFloat(UIScreen.main().bounds.width) - CGFloat(x[j]) * (CGFloat(UIScreen.main().bounds.width)/6.5) - 8 - 70
            //UIView.animate(withDuration: 3.0, animations: { Void in
                //self.barChart[j].frame = CGRect(x: 0, y: 0, width: (self.x[j] * 20), height: 50)
                
            //})
            j = j + 1
        }
        
    }

    @IBAction func cl(_ sender: AnyObject) {
        hello()
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
