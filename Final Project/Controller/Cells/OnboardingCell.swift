//
//  OnboardingCell.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 30/03/2023.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    static let ID = String(describing: OnboardingCell.self)
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var descriptionOutlet: UILabel!
    
    func setup(with pageItem:PageItem){
        self.imageOutlet.image = UIImage(named: pageItem.pageImg!)
        self.titleOutlet.text = pageItem.pageTitle
        self.descriptionOutlet.text = pageItem.pageDesc
    }
}
