//OrganizationStaffInformation.swift
//PureFindr.Offical
//Created by Franco Pieri & Martin Pieri

import Foundation
import UIKit

struct User {
    let id: Int
    let name: String
    let birthDate: String
    let occupation: String
    let email: String
}

class OrganizationFindUsersViewController: UIViewController {

    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel

    //Sample user data
    let users: [User] = [
        User(id: 1, name: "John Doe", birthDate: "01/15/1990", occupation: "Engineer", email: "john@example.com"),
        User(id: 2, name: "Jane Smith", birthDate: "04/22/1985", occupation: "Designer", email: "jane@example.com"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func findButtonTapped(_ sender: UIButton) {
        
        if let userIdText = userIdTextField.text, let userId = Int(userIdText) {
           
            if let user = users.first(where: { $0.id == userId }) {
               
                nameLabel.text = "Name: \(user.name)"
                birthDateLabel.text = "Birth Date: \(user.birthDate)"
                occupationLabel.text = "Occupation: \(user.occupation)"
                emailLabel.text = "Email: \(user.email)"
            } else {
                clearLabels()
            }
        } else {
            clearLabels()
        }
    }

    func clearLabels() {
        nameLabel.text = "Name: Not Found"
        birthDateLabel.text = "Birth Date: Not Found"
        occupationLabel.text = "Occupation: Not Found"
        emailLabel.text = "Email: Not Found"
    }
}

