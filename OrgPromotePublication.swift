//OrgPromotePublication.swift
//PureFindr.Offical
//Created by Franco Pieri & Martin Pieri

import Foundation
import UIKit
import TwitterKit
import FBSDKShareKit

class OrganizationPublicizeViewController: UIViewController {

    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var shareOnTwitterButton: UIButton
    @IBOutlet weak var shareOnFacebookButton: UIButton

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func shareOnTwitterButtonTapped(_ sender: UIButton) {
        let composer = TWTRComposer()

        if let message = messageTextView.text {
            composer.setText(message)
        } else 
        {
            return
        }
        
        composer.show(from: self) { result in
            if result == .done {
        
            } else if result == .cancelled {
                //The organization cancelled their promotion
            } else {
                //The organization's promotion failed
            }
        }
    }

    @IBAction func shareOnFacebookButtonTapped(_ sender: UIButton) {
        let content = ShareLinkContent()
        content.contentURL = URL(string: "https://example.com") //Default url
        content.quote = messageTextView.text

        let shareDialog = ShareDialog(fromViewController: self, content: content, delegate: nil)
        shareDialog.show()
    }
}
