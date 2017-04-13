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
    
    
    @IBOutlet weak var usernameTextField: UITextField!
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
        
        let username = "test"//usernameTextField.text
        let password = "test"//passwordTextField.text
        let email = "test@gmail.com"//emailTextField.text
        // other fields can be set just like with PFObject
        //user["phone"] = "415-392-0202"
        
        PFUser.logInWithUsername(inBackground: username, password: password){
            (succeeded, error) -> Void in
            if let error = error {
                //let errorString = error.userInfo["error"] as? NSString
                print(error.localizedDescription)

                // Show the errorString somewhere and let the user try again.
            } else {
                print("logged in")
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)

                // Hooray! Let them use the app now.
            }
        }
    }
    
    
    @IBAction func signupAction(_ sender: Any) {
        let user = PFUser()
        
        user.username = "test"
        user.email = emailTextField.text
        user.password = passwordTextField.text
        user.signUpInBackground { [unowned self] succeeded, error in
            guard succeeded == true else {
                print(error?.localizedDescription)
                self.showErrorView(error)
                return
            }
            print("sucess")
            // Successful registration, display the wall
            //self.performSegue(withIdentifier: Segue.tableViewWallSegue, sender: nil)
        }
    }
    
    func showErrorView(_ error: Error?) {
        guard let error = error as? NSError, let errorMessage = error.userInfo["error"] as? String else {
            return
        }
        
        let alertController = UIAlertController(title: NSLocalizedString("Error", comment: ""),
                                                message: errorMessage,
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: ""),
                                                style: .default))
        
        present(alertController, animated: true)
    }

    
    /*func myMethod() {
        var user = PFUser()
        user.username = "myUsername"
        user.password = "myPassword"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }*/

}

