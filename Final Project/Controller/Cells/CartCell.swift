//
//  CartCell.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 03/04/2023.
//

import UIKit

class CartCell: UICollectionViewCell {
    
    static let ID = String(describing: CartCell.self)
    
    var number = 1
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var priceOutlet: UILabel!
    @IBOutlet weak var numberOfItemsOutlet: UILabel!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if sender.tag == 1 {
            number -= 1
        }else{
            number += 1
        }
        
    }
}
