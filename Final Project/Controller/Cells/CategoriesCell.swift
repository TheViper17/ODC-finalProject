//
//  CategoriesCell.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 01/04/2023.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    static let ID = String(describing: CategoriesCell.self)
    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        buttonOutlet.backgroundColor = .black
        buttonOutlet.setTitleColor(.white, for: .normal)
    }
    
    
}
