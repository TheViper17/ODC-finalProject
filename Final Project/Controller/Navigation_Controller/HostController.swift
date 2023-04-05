//
//  HostController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 31/03/2023.
//

import UIKit

class HostController: UIViewController {
    
    static let ID = String(describing: HostController.self)
    @IBOutlet weak var hostView: UIView!
    
    var currentVC = HomeController.ID{
        didSet{
            replaceVC(currentVC)
        }
    }
    
    var lastSender = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        replaceVC(currentVC)
        toggleBtn(view.viewWithTag(lastSender)as! UIButton)
    }
    
    func replaceVC(_ VC:String){
        ViewEmbeder.embed(VC, parent: self, container: hostView)
    }
    
    func toggleBtn(_ sender:UIButton){
        
        sender.setImage(sender.currentImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        sender.tintColor = UIColor.systemTeal
        
    }

    @IBAction func navigationTapped(_ sender: UIButton) {
        
        if let lastPressedBtn:UIButton = view.viewWithTag(lastSender) as? UIButton{
            lastPressedBtn.setImage(lastPressedBtn.currentImage?.withRenderingMode(.alwaysTemplate), for: .normal)
            lastPressedBtn.tintColor = UIColor.black
        }
        
        
        switch sender.tag{
        case 1:
            print(sender.tag)
            currentVC = HomeController.ID
            toggleBtn(sender)
            sender.isSelected = true
        case 2:
            print(sender.tag)
            currentVC = CartController.ID
            toggleBtn(sender)
        case 3:
            print(sender.tag)
            currentVC = CategoriesController.ID
            toggleBtn(sender)
        default:
            print(sender.tag)
            currentVC = ProfileController.ID
            toggleBtn(sender)
        }
        
        lastSender = sender.tag
        
    }
    
    
    
}
