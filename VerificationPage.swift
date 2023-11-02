//
//  VerificationPage.swift
//  PureFindr.
//
//  Created by Franco Pieri on 4/1/23.
//

import Foundation
import Firebase
import UIKit
import RealmSwift

class VerificationPage: UIViewController {
    
    @IBOutlet weak var returnKey: UIButton!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           returnKey.addTarget(self, action: #selector(returnToPreviousViewController), for: .touchUpInside)
       }
       
       @objc func returnToPreviousViewController() {
           navigationController?.popViewController(animated: true)
       }
   }

