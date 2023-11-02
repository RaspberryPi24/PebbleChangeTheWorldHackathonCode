//  GoogleSignInFeature.swift
//  PureFindr.Offical
//  Created by Franco Pieri & Martin Pieri

import Foundation
import GoogleSignIn
import Firebase

class ViewController: UIViewController, GIDSignInDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
    }
    
    @IBAction func signInWithGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Google Sign-In Error: \(error.localizedDescription)")
            return
        }
        
        if let authentication = user.authentication {
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    print("Firebase Auth Error: \(error.localizedDescription)")
                    return
                }
            }
        }
    }
}

