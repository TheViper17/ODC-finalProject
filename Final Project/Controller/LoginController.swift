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
import SwiftUI

class LoginController: UIViewController {
    
    static let ID = String(describing: LoginController.self)
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailCheckmarkLogo: UIButton!
    @IBOutlet weak var passwordCheckmarkLogo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailCheckmarkLogo.alpha = 0
        passwordCheckmarkLogo.alpha = 0
        
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
            print("userFound")
            self.emailCheckmarkLogo.alpha = 1
            self.passwordCheckmarkLogo.alpha = 1
            UserDefaults.standard.set(true, forKey: "signedIn")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: SuccessfulController.ID) as! SuccessfulController
                self.navigationController?.pushViewController(vc, animated: true)
            }
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
                print("Google user Found")
                //print(res!.user.photoURL!)
                UserDefaults.standard.set(res!.user.email!, forKey: "emailField")
                UserDefaults.standard.set(res!.user.displayName!, forKey: "nameField")
                UserDefaults.standard.set(true, forKey: "signedIn")
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: SuccessfulController.ID) as! SuccessfulController
                self.navigationController?.pushViewController(vc, animated: true)
                
                //let user = res?.user
                //self.setupUI(user: user)
            }
        }
        
    }
    
}
