//
//  ProfileController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 31/03/2023.
//

import UIKit
import Kingfisher

class ProfileController: UIViewController {
    
    static let ID = String(describing: ProfileController.self)
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var emailOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    static var profileImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOutlet.text = UserDefaults.standard.string(forKey: "nameField")
        emailOutlet.text = UserDefaults.standard.string(forKey: "emailField")
        if ProfileController.profileImage != nil{
            imageOutlet.image = ProfileController.profileImage
        }else{
            imageOutlet.kf.setImage(with: URL(string: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"))
        }

    }

    @IBAction func settingTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: ProfileDetailesController.ID) as! ProfileDetailesController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func logoutTapped(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "signedIn")
        print("logged out")
    }
}
