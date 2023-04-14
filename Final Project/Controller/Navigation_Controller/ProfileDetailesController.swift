//
//  ProfileDetailesController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 13/04/2023.
//

import UIKit
import Kingfisher

class ProfileDetailesController: UIViewController {
    
    static let ID = String(describing: ProfileDetailesController.self)
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var maleOutlet: UIButton!
    @IBOutlet weak var femaleOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if imageOutlet.image == nil {
            imageOutlet.kf.setImage(with: URL(string: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"))
        }
        nameTextfield.text = UserDefaults.standard.string(forKey: "nameField")
        emailTextfield.text = UserDefaults.standard.string(forKey: "emailField")
        
    }
    @IBAction func switchTapped(_ sender: UISwitch) {
        if darkModeSwitch.isOn {
            darkModeLabel.text = "On"
        }else{
            darkModeLabel.text = "Off"
        }
    }
    
    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        return imagePicker
    }
    
    func showImagePickerOptions() {
        
        let alertVC = UIAlertController(title: "Pick a photo", message: "choose a picture from Library", preferredStyle: .actionSheet)
        
        let libraryAction = UIAlertAction(title: "Library", style: .default) { [weak self] (action) in
            guard let self = self else {
                return
            }
            let libraryImagePicker = self.imagePicker(sourceType: .photoLibrary)
            libraryImagePicker.delegate = self
            self.present(libraryImagePicker, animated: true) {
                //TODO
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertVC.addAction(libraryAction)
        alertVC.addAction(cancelAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func uploadTapped(_ sender: UIButton) {
        showImagePickerOptions()
    }
    
    
    @IBAction func saveTapped(_ sender: UIButton) {
        UserDefaults.standard.set(self.emailTextfield.text, forKey: "emailField")
        UserDefaults.standard.set(self.nameTextfield.text, forKey: "nameField")
    }
    
    
    @IBAction func GenderTapped(_ sender: UIButton) {
        
        if sender.currentTitle == "Male"{
            maleOutlet.backgroundColor = .black
            maleOutlet.setTitleColor(.white, for: .normal)
            femaleOutlet.backgroundColor = .white
            femaleOutlet.setTitleColor(.systemGray, for: .normal)
        }else{
            femaleOutlet.backgroundColor = .black
            femaleOutlet.setTitleColor(.white, for: .normal)
            maleOutlet.backgroundColor = .white
            maleOutlet.setTitleColor(.systemGray, for: .normal)
        }
    }
    
}

extension ProfileDetailesController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let image = info[.originalImage] as! UIImage
        self.imageOutlet.image = image
        ProfileController.profileImage = image
        self.dismiss(animated: true, completion: nil)
    }
    
}
