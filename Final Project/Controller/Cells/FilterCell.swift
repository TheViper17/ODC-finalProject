//
//  FilterCell.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 01/04/2023.
//

import UIKit

class FilterCell: UICollectionViewCell {
    
    static let ID = String(describing: FilterCell.self)
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        buttonOutlet.backgroundColor = .black
        buttonOutlet.setTitleColor(.white, for: .normal)
    }
}
