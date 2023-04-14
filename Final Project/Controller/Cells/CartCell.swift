//
//  CartCell.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 03/04/2023.
//

import UIKit

class CartCell: UICollectionViewCell {
    
    static let ID = String(describing: CartCell.self)
    
    static var number = 1
    
    static var numberArray : [Int] = []
    static var itemPrice : [Double] = []
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var priceOutlet: UILabel!
    @IBOutlet weak var numberOfItemsOutlet: UILabel!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        // minus button
//        if sender.tag == 1 {
//            if CartCell.number == 1 {
//                print("minimum number selected")
//            }else{
//                CartCell.number -= 1
//                numberOfItemsOutlet.text = "\(CartCell.number)"
//            }
//            // plus button
//        }else{
//            CartCell.number += 1
//            numberOfItemsOutlet.text = "\(CartCell.number)"
//        }
        
    }
}
