//
//  SignupController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 31/03/2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import SwiftCheckBox

class SignupController: UIViewController {
    
    static let ID = String(describing: SignupController.self)
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    
    @IBOutlet weak var checkboxOutlet: CheckBoxButton!
    @IBOutlet weak var usernameCheckmarkLogo: UIButton!
    @IBOutlet weak var emailCheckmarkLogo: UIButton!
    @IBOutlet weak var hidePasswordLogo: UIButton!
    @IBOutlet weak var hideConfirmPasswordLogo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameCheckmarkLogo.alpha = 0
        emailCheckmarkLogo.alpha = 0
        
    }
    
    @IBAction func showPasswordTapped(_ sender: UIButton) {
        
        if sender.tag == 1 {
            if passwordTextfield.isSecureTextEntry{
                passwordTextfield.isSecureTextEntry = false
            }else{
                passwordTextfield.isSecureTextEntry = true
            }
        }else{
            if confirmPasswordTextfield.isSecureTextEntry{
                confirmPasswordTextfield.isSecureTextEntry = false
            }else{
                confirmPasswordTextfield.isSecureTextEntry = true
            }
            
        }
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        if passwordTextfield.text == confirmPasswordTextfield.text && usernameTextfield.text != "" && emailTextfield.text != "" {
            if checkboxOutlet.isSelected {
                signInWithEmail()
            }else{
                print("mark the checkbox first")
            }
            
        }else{
            print("check passwords are equal or make sure username and email fields are not empty")
        }
        
        
    }
    
    func signInWithEmail(){
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { res, error in
            
            guard error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            print("signed up")
            self.usernameCheckmarkLogo.alpha = 1
            self.emailCheckmarkLogo.alpha = 1
            UserDefaults.standard.set(true, forKey: "signedIn")
            UserDefaults.standard.set(self.emailTextfield.text, forKey: "emailField")
            UserDefaults.standard.set(self.usernameTextfield.text, forKey: "nameField")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: SuccessfulController.ID) as! SuccessfulController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            //self.setupUI(user: res?.user)
            
            
        }
    }
    
}
