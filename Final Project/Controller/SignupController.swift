//
//  SignupController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 31/03/2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class SignupController: UIViewController {
    
    static let ID = String(describing: SignupController.self)

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        signInWithEmail()
    }
    
    func signInWithEmail(){
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { res, error in
            
            guard error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            //self.setupUI(user: res?.user)
            print("signed up")
        }
    }

}
