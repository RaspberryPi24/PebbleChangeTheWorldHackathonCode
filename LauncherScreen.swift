//
//  LauncherScreen.swift
//  PureFindr.
//
//  Created by Franco Pieri on 4/1/23.
//

import Foundation
import Firebase
import UIKit
import RealmSwift

class LauncherScreen: UIViewController {
    
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Set initial alpha values to 0
           imageView1.alpha = 0
           imageView2.alpha = 0
           imageView3.alpha = 0
       }
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           
           // Animate the image views
           UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
               self.imageView1.alpha = 1.0
           })
           
           UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
               self.imageView2.alpha = 1.0
           })
           
           UIView.animate(withDuration: 1.0, delay: 1.0, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
               self.imageView3.alpha = 1.0
           })
           // Use a Timer to transition to the next view controller after 5 seconds
                  Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
                      // Instantiate the next view controller
                      let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                      
                      // Present the next view controller
                      self.present(nextViewController, animated: true, completion: nil)
                  }
              }

          }
