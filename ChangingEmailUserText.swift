//  ChangingEmailUserText.swift
//  PureFindr.Offical
//  Created by Franco Pieri & Martin Pieri

import Foundation
import UIKit

class ViewController: UIViewController {

    let importedEmail = "user@example.com" //Replace with user's imported email

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var emailText = ""
        
        switch importedEmail {
        case "user@example.com":
            emailText = "Hello, User! Welcome to our app."
        case "another@example.com":
            emailText = "Hello, Another User! We're glad you're here."
        default:
            emailText = "Hello, New User! Thanks for joining."
        }
        
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 300, height: 100))
        label.text = emailText
        self.view.addSubview(label)
    }
}
