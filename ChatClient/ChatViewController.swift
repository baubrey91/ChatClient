//
//  ChatViewController.swift
//  ChatClient
//
//  Created by Brandon Aubrey on 4/12/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendChat(_ sender: Any) {
        
        var message = PFObject(className:"Message")
        message["text"] = chatTextField.text
        message.saveInBackground {
            (success: Bool, error: Error?) -> Void in
            if (success) {
                print("save")
                // The object has been saved.
            } else {
                
                print("save")

                // There was a problem, check error.description
            }
        }
        
        
    }
}
