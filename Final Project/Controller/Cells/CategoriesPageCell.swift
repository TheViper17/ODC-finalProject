//
//  CategoriesPageCell.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 01/04/2023.
//

import UIKit

class CategoriesPageCell: UICollectionViewCell {
    
    static let ID = String(describing: CategoriesPageCell.self)
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var productsNumber: UILabel!
    
}
