//
//  LoginController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 31/03/2023.
//

import UIKit
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

class LoginController: UIViewController {
    
    static let ID = String(describing: LoginController.self)
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func googleSigninTapped(_ sender: UIButton) {
        signinWithGoogle()
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        signIn()
    }
    
    func signIn() {
        
        Auth.auth().signIn(withEmail: emailTextfield.text! , password: passwordTextfield.text!) { authResult, error in
            
            guard error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            print("userFoundddddd")
        }
    }
    
    func signinWithGoogle() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let user = signInResult?.user,let idToken = user.idToken?.tokenString else{
                print(error!)
                print("user invalid")
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { res, error in
                
                guard error == nil else {
                    print("error in auth \(String(describing: error))")
                    return
                }
                //let user = res?.user
                
                //self.setupUI(user: user)
            }
        }
        
    }
    
}
