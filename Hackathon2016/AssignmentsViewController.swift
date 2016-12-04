//
//  AssignmentsViewController.swift
//  Hackathon2016
//
//  Created by Laurent Shala on 12/4/16.
//  Copyright © 2016 Laurent Shala. All rights reserved.
//

import UIKit
import Firebase

class AssignmentsViewController: UITableViewController {

    @IBAction func signOutBarButton(_ sender: UIBarButtonItem) {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            print("Cancel")
        }
        
        let deleteActionButton: UIAlertAction = UIAlertAction(title: "Sign Out", style: .destructive) { action -> Void in
            print("Sign Out")            
        }
        
        actionSheetController.addAction(cancelActionButton)
        actionSheetController.addAction(deleteActionButton)
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
