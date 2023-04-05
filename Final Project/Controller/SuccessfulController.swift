//
//  SuccessfulController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 31/03/2023.
//

import UIKit

class SuccessfulController: UIViewController {
    
    static let ID = String(describing: SuccessfulController.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func startShoppingTapped(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: HostController.ID) as! HostController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
