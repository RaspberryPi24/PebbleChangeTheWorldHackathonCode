//HomeMenuNameView.swift
//PureFindr.Offical
//Created by Franco Pieri & Martin Pieri

import Foundation
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let organizationName = OrganizationDataManager.shared.organizationName {
            welcomeLabel.text = "Welcome, \(organizationName)!"
        } else {
        
            welcomeLabel.text = "Welcome!"
        }
    }
}

