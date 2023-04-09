//
//  ProductsDescriptionController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 03/04/2023.
//

import UIKit
import Kingfisher
import Alamofire

class ProductsDescriptionController: UIViewController {
    
    static let ID = String(describing: ProductsDescriptionController.self)
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UITextView!
    @IBOutlet weak var itemPrice: UILabel!
    
    var pageItemTitle = "title"
    var pageItemDescription = "itemDescription"
    var pageItemPrice = "$ 198.00"
    var itemID = 0
    
    var pageCells : [String] = []
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        itemTitle.text = pageItemTitle
        itemDescription.text = pageItemDescription
        
    }

    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addToCartTapped(_ sender: UIButton) {
        CartController.getCartData(index: itemID)
        print("added")
    }
}


extension ProductsDescriptionController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsDescriptionCell.ID, for: indexPath) as! ProductsDescriptionCell
        cell.image.kf.setImage(with: URL(string: self.pageCells[indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
