//
//  CartController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 31/03/2023.
//

import UIKit
import Kingfisher
import Alamofire

class CartController: UIViewController {
    
    static let ID = String(describing: CartController.self)
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var itemsNumberLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    static var cartItemsNumber = 0
    static var totalPrice = 0.0000
    
    static var pageData : [DataDescription] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        itemsNumberLabel.text = "Total (\(CartController.cartItemsNumber) items)"
        numberLabel.text = "\(CartController.cartItemsNumber)"
        //totalPriceLabel.text = "$ \(CartController.totalPrice)"
        totalPriceLabel.text = "$ \(CartCell.itemPrice.reduce(0,+))"
        
    }
    
//    static func getCartData(index:Int) {
//
//        AF.request(API.BASE_URL + "categories" + "/\(index)", method: .get , headers: HomeController.headers).responseDecodable(of: MainCategoriesDescription.self){ res in
//
//            switch res.result {
//            case .success(let categoriesDetailes):
//                CartController.pageData = categoriesDetailes.data.data
//            case .failure(let er):
//                print("failed to get cart data")
//                print(er)
//            }
//
//        }
//
//    }

}

extension CartController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CartController.pageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartCell.ID, for: indexPath) as! CartCell
        cell.titleOutlet.text = CartController.pageData[indexPath.row].name
        //cell.priceOutlet.text = "$ \(CartController.pageData[indexPath.row].price)"
        cell.priceOutlet.text = "$ \(CartCell.itemPrice[indexPath.row])"
        cell.imageOutlet.kf.setImage(with: URL(string: CartController.pageData[indexPath.row].image))
        cell.numberOfItemsOutlet.text = "\(CartCell.numberArray[indexPath.row])"
        cell.cellIndex.append(indexPath.row)
        return cell
        
    }
    
}
