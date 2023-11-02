//OrganizationVerification.swift
//PureFindr.Offical
//Created by Franco Pieri & Martin Pieri

import Foundation
import UIKit

class RescueOrganizationSignUpViewController: UIViewController {

    @IBOutlet weak var organizationNameTextField: UITextField!
    @IBOutlet weak var contactEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField
    @IBOutlet weak var confirmPasswordTextField: UITextField
    @IBOutlet weak var verificationCodeTextField: UITextField
    @IBOutlet weak var signUpButton: UIButton

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        //I am Validating user input (e.g., password confirmation, non-empty fields)

        let organizationName = organizationNameTextField.text ?? ""
        let contactEmail = contactEmailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        let verificationCode = verificationCodeTextField.text ?? ""
        
        // If validation is successful, you can proceed with verifying the organization
        // For a real application, this is where you'd integrate with your backend and database
        // to verify the organization's legitimacy using the provided data.
        
        if password == confirmPassword {
            // Passwords match
            if verifyOrganizationLegitimacy(organizationName: organizationName, contactEmail: contactEmail, password: password, verificationCode: verificationCode) {
                // Organization is verified
                // You can proceed with account creation or other actions
            } else {
                // Organization verification failed
                // Show an error message or take appropriate action
            }
        } else {
            // Passwords do not match
            // Show an error message or take appropriate action
        }
    }
    
    // Example function to simulate organization verification (replace with your backend logic)
    func verifyOrganizationLegitimacy(organizationName: String, contactEmail: String, password: String, verificationCode: String) -> Bool {
        // Simulated logic, replace with actual verification process
        if organizationName == "ExampleOrg" && contactEmail == "org@example.com" && password == "password" && verificationCode == "123456" {
            return true
        }
        return false
    }
}
