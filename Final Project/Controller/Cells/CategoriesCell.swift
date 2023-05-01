//
//  CategoriesCell.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 01/04/2023.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    static let ID = String(describing: CategoriesCell.self)
    
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    func cellSelection() {
        categoryTitle.textColor = .white
        cellView.backgroundColor = .black
    }
    
    func cellDeselection() {
        categoryTitle.textColor = .black
        cellView.backgroundColor = .white
    }
    
}
