//
//  NavViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 20/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //self.navigationController?.navigationBar.barTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationBar.barTintColor = UIColor.white()
        self.navigationBar.tintColor = UIColor.white()
        // Do any additional setup after loading the view.
        
        //let img = UIImage(named: "1")
        //let imageView = UIImageView(frame: self.view.frame)
        //imageView.image = img
        //view.addSubview(imageView)
        //view.sendSubview(toBack: imageView)
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
