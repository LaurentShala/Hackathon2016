//
//  SignUpViewController.swift
//  Hackathon2016
//
//  Created by Laurent Shala on 12/4/16.
//  Copyright © 2016 Laurent Shala. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordTwoTextField: UITextField!
    
    
    
    
    @IBAction func signInButton(_ sender: UIButton) {
        
        if(passwordTextField.text != passwordTwoTextField.text) {
            print("Passwords are not the same!")
            return
        }
        
        FIRAuth.auth()!.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { user, error in
            if error == nil {
                FIRAuth.auth()!.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!)
            }
        }
    }
    
    
    

    @IBAction func cancelBarButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTwoTextField.delegate = self;

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
    
 

}
