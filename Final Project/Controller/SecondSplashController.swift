//
//  SecondSplashController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 30/03/2023.
//

import UIKit

class SecondSplashController: UIViewController {
    
    static let ID = String(describing: SecondSplashController.self)

    static var loginSwitch = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if UserDefaults.standard.bool(forKey: "onBoardingVisited") == false && sender.tag == 1 {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: OnboardingController.ID) as! OnboardingController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if UserDefaults.standard.bool(forKey: "onBoardingVisited") == false && sender.tag == 2{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: OnboardingController.ID) as! OnboardingController
            self.navigationController?.pushViewController(vc, animated: true)
            SecondSplashController.loginSwitch = false
            }
            else{
                if sender.tag == 1 {
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyBoard.instantiateViewController(withIdentifier: LoginController.ID) as! LoginController
                    self.navigationController?.pushViewController(vc, animated: true)
                }else{
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyBoard.instantiateViewController(withIdentifier: SignupController.ID) as! SignupController
                    self.navigationController?.pushViewController(vc, animated: true)
                    SecondSplashController.loginSwitch = false
            }
        }
        
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: SuccessfulController.ID) as! SuccessfulController
//        self.navigationController?.pushViewController(vc, animated: true)
        

        
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: OnboardingController.ID) as! OnboardingController
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
