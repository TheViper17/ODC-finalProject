//
//  HomeController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 31/03/2023.
//

import UIKit
import Alamofire

class HomeController: UIViewController {

    static let ID = String(describing: HomeController.self)
    
    @IBOutlet weak var mainCategoriesCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    var categoryNames = ["back" , "Bag" , "Logo" , "Voice", "menu" , "twitter" , "google"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCategoriesCollectionView.delegate = self
        mainCategoriesCollectionView.dataSource = self
        getMainCategories()
        
    }
    
    
    func getMainCategories() {
        
        let headers: HTTPHeaders = ["lang" : "en"]
        
        AF.request(API.BASE_URL + "categories" , method: .get , headers: headers).responseDecodable(of: MainCategoriesModel.self){ res in
            print("into main categories api")
            
            switch res.result {
            case .success(let categories):
                print(categories.data.data[0].name)
            case .failure(let er):
                print("failed to get main category")
                print(er)
            }
        }
    }

}

extension HomeController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.ID, for: indexPath) as! CategoriesCell

        cell.buttonOutlet.setTitle(categoryNames[indexPath.row], for: .normal)
        
        return cell
    }
    
}
