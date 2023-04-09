//
//  NotificationController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 31/03/2023.
//

import UIKit
import Kingfisher
import Alamofire

class CategoriesController: UIViewController {
    
    static let ID = String(describing: CategoriesController.self)
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    static var mainCategoryNames:[Description] = []
    static var numberOfItems : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.reloadData()
        
    }
    
    static func getCategoriesDetailesCount(index:Int) {

        AF.request(API.BASE_URL + "categories" + "/\(index)", method: .get , headers: HomeController.headers).responseDecodable(of: MainCategoriesDescription.self){ res in

            //print("into number call")
            switch res.result {
            case .success(let categoriesDetailes):
                //CategoriesController.numberOfItems.append(categoriesDetailes.data.data.count)
                CategoriesController.numberOfItems = categoriesDetailes.data.data.count
                //print(categoriesDetailes.data.data.count)
            case .failure(let er):
                print("failed to get main category detailes")
                print(er)
            }
        }

    }

    
}

extension CategoriesController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoriesController.mainCategoryNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesPageCell.ID, for: indexPath) as! CategoriesPageCell
        cell.title.text = CategoriesController.mainCategoryNames[indexPath.row].name
        cell.productsNumber.text = "\(CategoriesController.numberOfItems) products"
        cell.image.kf.setImage(with: URL(string: CategoriesController.mainCategoryNames[indexPath.row].image))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let vc = storyboard?.instantiateViewController(withIdentifier: CategoriesPageController.ID) as! CategoriesPageController
        vc.getCategoriesDetailesData(index: HomeController.categoryNames[indexPath.row].id)
        vc.pageTitle = "\(HomeController.categoryNames[indexPath.row].name)"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
