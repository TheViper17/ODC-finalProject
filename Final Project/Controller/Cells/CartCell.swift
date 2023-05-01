//
//  CartCell.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 03/04/2023.
//

import UIKit

class CartCell: UICollectionViewCell {
    
    static let ID = String(describing: CartCell.self)
    
    var cellIndex : [Int] = []
    
    static var numberArray : [Int] = []
    static var itemPrice : [Double] = []
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var priceOutlet: UILabel!
    
    
    @IBOutlet weak var minusOutlet: UILabel!
    @IBOutlet weak var plusOutlet: UILabel!
    @IBOutlet weak var numberOfItemsOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabelTap()
    }
    
    func setupLabelTap() {
        
        let minusTap = UITapGestureRecognizer(target: self, action: #selector(self.minusTapped(_:)))
        
        let plusTap = UITapGestureRecognizer(target: self, action: #selector(self.plusTapped(_:)))
        
        self.minusOutlet.isUserInteractionEnabled = true
        self.minusOutlet.addGestureRecognizer(minusTap)

        self.plusOutlet.isUserInteractionEnabled = true
        self.plusOutlet.addGestureRecognizer(plusTap)
        
    }
    
    @objc func minusTapped(_ sender: UITapGestureRecognizer) {
        print("minusTapped index: \(cellIndex[0])")
        //print("\(cellIndex[0])")
        print("\(CartCell.numberArray[cellIndex[0]])")
        print("\(CartCell.itemPrice[cellIndex[0]])")
    }
    
    @objc func plusTapped(_ sender: UITapGestureRecognizer) {
        print("plusTapped \(cellIndex[0])")
        //print("\(cellIndex[0])")
        print("\(CartCell.numberArray[cellIndex[0]])")
        print("\(CartCell.itemPrice[cellIndex[0]])")
    }
    
}
