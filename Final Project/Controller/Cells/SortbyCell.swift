//
//  SortbyCell.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 01/04/2023.
//

import UIKit

class SortbyCell: UICollectionViewCell {
    
    static let ID = String(describing: SortbyCell.self)
    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        buttonOutlet.backgroundColor = .black
        buttonOutlet.setTitleColor(.white, for: .normal)
    }
}
