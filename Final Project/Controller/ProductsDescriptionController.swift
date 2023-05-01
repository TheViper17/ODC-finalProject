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
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    
    var item : DataDescription?
    var numberOfSelectedItems = 1
    var itemPriceLabel : Double?
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        itemTitle.text = item?.name
        itemDescription.text = item?.description
        itemPriceLabel = item!.price
        itemPrice.text = "$ \(itemPriceLabel ?? 0.00)"
        
    }
    
    @IBAction func stepperTapped(_ sender: UIButton) {
        // minus button
        if sender.tag == 1 {
            if numberOfSelectedItems == 1 {
                print("minimum number selected")
            }else{
                numberOfSelectedItems -= 1
                itemPriceLabel! -= item!.price
                numberOfItemsLabel.text = "\(numberOfSelectedItems)"
                itemPrice.text = "$ \(itemPriceLabel ?? 0.00)"
            }
            // plus button
        }else{
            numberOfSelectedItems += 1
            itemPriceLabel! += item!.price
            numberOfItemsLabel.text = "\(numberOfSelectedItems)"
            itemPrice.text = "$ \(itemPriceLabel ?? 0.00)"
        }
    }

    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addToCartTapped(_ sender: UIButton) {
        //CartController.getCartData(index: itemID)
        CartController.pageData.append(item!)
        CartController.cartItemsNumber += 1
        CartCell.numberArray.append(numberOfSelectedItems)
        CartCell.itemPrice.append(itemPriceLabel!)
        //CartController.totalPrice += item!.price
        print("added")
    }
}


extension ProductsDescriptionController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return pageCells.count
        return item?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsDescriptionCell.ID, for: indexPath) as! ProductsDescriptionCell
       // cell.image.kf.setImage(with: URL(string: self.pageCells[indexPath.row]))
        cell.image.kf.setImage(with: URL(string: self.item?.images[indexPath.row] ?? ""))
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
