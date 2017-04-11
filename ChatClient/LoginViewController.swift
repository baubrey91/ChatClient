//
//  ViewController.swift
//  ChatClient
//
//  Created by Brandon on 4/11/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func loginAction(_ sender: Any) {
        
        var user = PFUser()
        user.username = "myUsername"
        user.password = passwordTextField.text
        user.email = emailTextField.text
        // other fields can be set just like with PFObject
        //user["phone"] = "415-392-0202"
        
        user.signUpInBackground {
            (succeeded, error) -> Void in
            if let error = error {
                //let errorString = error.userInfo["error"] as? NSString
                print(error.localizedDescription)

                // Show the errorString somewhere and let the user try again.
            } else {
                print("logged in")

                // Hooray! Let them use the app now.
            }
        }
    }
    
    
    @IBAction func signupAction(_ sender: Any) {
        
    }

}

