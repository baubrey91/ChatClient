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
    
    var messages = [PFObject]()

    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ChatViewController.onTimer), userInfo: nil, repeats: true)


        // Do any additional setup after loading the view.
    }
    
    func onTimer() {
        
        var query = PFQuery(className:"Message")
        query.includeKey("text")
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackground(){
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                
                self.messages = objects!
                self.tableView.reloadData()


            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.localizedDescription)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //this is my change
    }
    
    @IBAction func sendChat(_ sender: Any) {
        
        let message = PFObject(className:"Message")
        message["text"] = chatTextField.text
        message["user"] = PFUser.current()
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

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell")
        
        cell?.textLabel?.text = messages[indexPath.row]["text"] as! String
        if let user = messages[indexPath.row]["user"] as? String{
            cell?.detailTextLabel?.text = user
        }
        return cell!
    }
}
