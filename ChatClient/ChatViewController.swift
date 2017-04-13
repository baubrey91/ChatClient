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
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ChatViewController.onTimer), userInfo: nil, repeats: true)


        // Do any additional setup after loading the view.
    }
    
    func onTimer() {
        
//        var query = PFQuery(className:"Message")
//        query.includeKey("text")
//        //query.whereKey("text", equalTo:"Sean Plott")
//        query.findObjectsInBackground {
//        //query.findObjectsInBackgroundWithBlock {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            
//            if error == nil {
//                // The find succeeded.
//                print("Successfully retrieved \(objects!.count) scores.")
//                // Do something with the found objects
//                if let objects = objects {
//                    for object in objects {
//                        print(object.objectId)
//                    }
//                }
//            } else {
//                // Log details of the failure
//                print("Error: \(error!) \(error!.userInfo)")
//            }
//        } as! ([PFObject]?, Error?) -> Void
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //this is my change
    }
    
    @IBAction func sendChat(_ sender: Any) {
        
        let message = PFObject(className:"Message")
        message["text"] = chatTextField.text
        message.saveInBackground {
            (success: Bool, error: Error?) -> Void in
            if (success) {
                print("save")
                // The object has been saved.
            } else {
                print("not saved")
                // There was a problem, check error.description
            }
        }
        
    }
}
