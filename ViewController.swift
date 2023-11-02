//
//  ViewController.swift
//  PureFindr.
//
//  Created by Franco Pieri 
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var SigninPopButton: UIButton!
    @IBOutlet weak var SecondView: UIView!
    
    @IBOutlet weak var SignUpPopButton: UIButton!
    @IBOutlet weak var ThirdView: UIView!
    
    @IBOutlet weak var returnKey: UIButton!
    @IBOutlet weak var returnKeyThree: UIButton!
    
    @IBOutlet weak var signUpEmail: UILabel!
    @IBOutlet weak var signUpPassword: UILabel!
    
    @IBAction func signUpEmail(_ sender: Any) {
    }
    
    @IBAction func signUpPassword(_ sender: Any) {
    }
    
    @IBAction func showPwd(_ sender: UIButton) {
        if sender.tag == 0 {
               // Show the password and set the button image to "hide password"
               sender.tag = 1
               passwordTextField.isSecureTextEntry = true
               sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
           } else {
               // Hide the password and set the button image to "show password"
               sender.tag = 0
               passwordTextField.isSecureTextEntry = false
               sender.setImage(UIImage(systemName: "eye"), for: .normal)
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Set the text content type for the password text field
                passwordTextField.textContentType = .oneTimeCode
        
        // Hide the second view initially
        SecondView.isHidden = true
        ThirdView.isHidden = true
        
        // Add a target to the sign-in button
        SigninPopButton.addTarget(self, action: #selector(showSecondView), for: .touchUpInside)
        SignUpPopButton.addTarget(self, action: #selector(showThirdView), for: .touchUpInside)
        
        // Add a target to the return buttons
        returnKey.addTarget(self, action: #selector(hideSecondView), for: .touchUpInside)
        returnKeyThree.addTarget(self, action: #selector(hideThirdView), for: .touchUpInside)
    }
    
    @objc func showSecondView() {
        // Show the second view
        SecondView.isHidden = false
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity:0, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc func showThirdView() {
        //show the third view
        ThirdView.isHidden = false
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity:0, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc func hideSecondView() {
        SecondView.isHidden = true
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity:0, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        }, completion: nil)
    }
        
    @objc func hideThirdView() {
        ThirdView.isHidden = true
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity:0, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()
        }, completion: nil)
    }
        
   
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                       
                        print("Error creating new user account: \(error.localizedDescription)")
                    } else {
                        
                        self.performSegue(withIdentifier: "moveOn", sender: self)
                    }
                }
            } else {
                self.performSegue(withIdentifier: "moveOnPlease", sender: self)
            }
        }
    }
    
    @IBAction func signUpClicked(_ sender: UIButton) {
    }
    
    @IBAction func unwindToPreferencePage(_ segue: UIStoryboardSegue) {
        // code to run when unwinding to this view controller
    }
}
    
  
       
            
        
    
    








