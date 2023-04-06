//
//  ProductsCell.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 01/04/2023.
//

import UIKit

class ProductsCell: UICollectionViewCell {
    
    static let ID = String(describing: ProductsCell.self)
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var loveOutlet: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
}
