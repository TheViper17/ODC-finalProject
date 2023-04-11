//
//  ViewController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 30/03/2023.
//

import UIKit
import NVActivityIndicatorView

class SplashController: UIViewController {
    
    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!
    static let ID = String(describing : SplashController.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        
        activityIndicator.alpha = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.activityIndicator.alpha = 1
            self.activityIndicator.startAnimating()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            if UserDefaults.standard.bool(forKey: "signedIn") == true {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: HostController.ID) as! HostController
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: SecondSplashController.ID) as! SecondSplashController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
        
    }
    
    
}

