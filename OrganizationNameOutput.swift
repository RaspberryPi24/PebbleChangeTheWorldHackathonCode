//OrganizationNameOutput.swift
//PureFindr.Offical
//Created by Franco Pieri & Martin Pieri

import Foundation
import UIKit

class OrganizationNameViewController: UIViewController {

    @IBOutlet weak var organizationNameLabel: UILabel!
    @IBOutlet weak var organizationNameTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func updateTextButtonTapped(_ sender: UIButton) {
        if let organizationName = organizationNameTextField.text, !organizationName.isEmpty {

            organizationNameLabel.text = "Welcome, \(organizationName)!"
        } else {
            
            organizationNameLabel.text = "Please enter your organization's name."
        }
    }
}

