//
//  SecondSplashController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 30/03/2023.
//

import UIKit

class SecondSplashController: UIViewController {
    
    static let ID = String(describing: SecondSplashController.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if sender.tag == 1 {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: LoginController.ID) as! LoginController
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: SignupController.ID) as! SignupController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: OnboardingController.ID) as! OnboardingController
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
