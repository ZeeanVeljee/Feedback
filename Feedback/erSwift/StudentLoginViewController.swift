//
//  StudentLoginViewController.swift
//  Feedback
//
//  Created by Mustafa Yusuf on 21/07/16.
//  Copyright © 2016 Mustafa Yusuf. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class StudentLoginViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    @IBOutlet weak var loading: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: NSError!) {
        loading.startAnimating()
        if let error = error {
            self.loading.stopAnimating()
            print(error.localizedDescription)
            return
        }
        
        let authentication = user.authentication
        let credentials = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!, accessToken: (authentication?.accessToken)!)
        
        FIRAuth.auth()?.signIn(with: credentials, completion: {(user, error) in
            
            if error != nil {
                self.loading.stopAnimating()
                //print(error?.localizedDescription)
                return
            }
            if user?.email?.contains("@vit.ac.in") == true {
                print(user?.email)
                print("\n\n\n\n")
                self.loading.stopAnimating()
                UserDefaults.standard.set(true, forKey: "student")
                self.performSegue(withIdentifier: "loggedIn", sender: nil)
            } else {
                print("ENTER VIT EMAIL ID")
                self.alert()
                self.loading.stopAnimating()
                UserDefaults.standard.removeObject(forKey: "student")
                GIDSignIn.sharedInstance().signOut()
            }

        })
        
    }
    
    func alert(){
        let alert = UIAlertController(title: "Try Again", message: "Enter your VIT Gmail ID",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user:GIDGoogleUser!,
              withError error: NSError!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        let authentication = user.authentication
        let credentials = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!, accessToken: (authentication?.accessToken)!)
        
        FIRAuth.auth()?.signIn(with: credentials, completion: {(user, error) in
            
            if error != nil {
                //print(error?.localizedDescription)
            }
            
        })
        
        // ...
    }*/
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
