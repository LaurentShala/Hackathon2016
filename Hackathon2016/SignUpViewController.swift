//
//  SignUpViewController.swift
//  Hackathon2016
//
//  Created by Laurent Shala on 12/4/16.
//  Copyright © 2016 Laurent Shala. All rights reserved.
//

import UIKit
import Firebase
import NVActivityIndicatorView

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var spinner: NVActivityIndicatorView?
    var loadingView: UIView = UIView()

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordTwoTextField: UITextField!
    
    
    @IBAction func signInButton(_ sender: UIButton) {
        showActivityIndicator()

        
        if(passwordTextField.text != passwordTwoTextField.text) {
            let alertController = UIAlertController(title: "Sign Up Error", message: "The passwords are not the same", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            passwordTextField.text = nil
            passwordTwoTextField.text = nil
            return
        }
        
        FIRAuth.auth()!.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (FIRUser, Error) in
            if Error == nil {
                FIRAuth.auth()!.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!)
                self.hideActivityIndicator()
                let alertController = UIAlertController(title: "Signed Up", message: "You are now signed up", preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)

            }else {
                print(Error!)
                self.hideActivityIndicator()
                let alertController = UIAlertController(title: "Sign up Error", message: "There was sign up problem", preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                sender.isEnabled = true
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

    
    func showActivityIndicator() {
        self.loadingView = UIView()
        self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        self.loadingView.center = self.view.center
        self.loadingView.alpha = 0.9
        self.loadingView.clipsToBounds = true
        self.loadingView.layer.cornerRadius = 10
        
        self.spinner = NVActivityIndicatorView(frame: self.view.frame, type: NVActivityIndicatorType.ballClipRotatePulse, color: UIColor.white, padding: nil)
        self.spinner?.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        self.spinner?.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
        
        self.loadingView.addSubview(self.spinner!)
        self.view.addSubview(self.loadingView)
        self.spinner?.startAnimating()
    }
    
    func hideActivityIndicator() {
        self.spinner?.stopAnimating()
        self.loadingView.removeFromSuperview()
    }

    
    
 

}
