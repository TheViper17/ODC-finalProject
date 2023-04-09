//
//  ProductsPageCell.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 03/04/2023.
//

import UIKit

class ProductsPageCell: UICollectionViewCell {
    
    static let ID = String(describing: ProductsPageCell.self)
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    
}
