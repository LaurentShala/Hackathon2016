//
//  ViewController.swift
//  Hackathon2016
//
//  Created by Laurent Shala on 12/4/16.
//  Copyright © 2016 Laurent Shala. All rights reserved.
//

import UIKit
import Firebase
import NVActivityIndicatorView

class LoginViewController: UIViewController, UITextFieldDelegate {

    var spinner: NVActivityIndicatorView?
    var loadingView: UIView = UIView()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        showActivityIndicator()
        sender.isEnabled = false
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (FIRUser, Error) in
            if Error == nil {
                print("SIGNED IN")
                self.hideActivityIndicator()
                sender.isEnabled = true
//                self.performSegue(withIdentifier: "testID", sender: self)
            }else {
                print(Error!)
                self.hideActivityIndicator()
                sender.isEnabled = true
            }
        })
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTextField.delegate = self
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

