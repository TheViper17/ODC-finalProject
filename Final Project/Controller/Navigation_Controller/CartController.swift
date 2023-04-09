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
    
    static var pageData : [DataDescription] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        
    }
    
    static func getCartData(index:Int) {

        AF.request(API.BASE_URL + "categories" + "/\(index)", method: .get , headers: HomeController.headers).responseDecodable(of: MainCategoriesDescription.self){ res in

            switch res.result {
            case .success(let categoriesDetailes):
                CartController.pageData = categoriesDetailes.data.data
            case .failure(let er):
                print("failed to get cart data")
                print(er)
            }
            
        }

    }

}

extension CartController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return CartController.pageData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartCell.ID, for: indexPath) as! CartCell
        cell.titleOutlet.text = CategoriesPageController.categoryPageDetailes[indexPath.row].name
        cell.priceOutlet.text = "$ \(CategoriesPageController.categoryPageDetailes[indexPath.row].price)"
        cell.imageOutlet.kf.setImage(with: URL(string: CategoriesPageController.categoryPageDetailes[indexPath.row].image))
        return cell
        
    }
    
}
