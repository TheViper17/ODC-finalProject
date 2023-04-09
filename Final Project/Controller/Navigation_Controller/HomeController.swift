//
//  HomeController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 31/03/2023.
//

import UIKit
import Alamofire
import Kingfisher

class HomeController: UIViewController {

    static let ID = String(describing: HomeController.self)
    static let headers: HTTPHeaders = ["lang" : "en"]
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var categoriesDetailesCollectionView: UICollectionView!

    static var categoryNames:[Description] = []
    var categoryDetailes:[DataDescription] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesDetailesCollectionView.delegate = self
        categoriesDetailesCollectionView.dataSource = self
        getMainCategories()
    }
    
    func getMainCategories() {
        
        AF.request(API.BASE_URL + "categories" , method: .get , headers: HomeController.headers).responseDecodable(of: MainCategoriesModel.self){ res in
            //print("into main categories api")
            
            switch res.result {
            case .success(let categories):
                HomeController.categoryNames = categories.data.data
                CategoriesController.mainCategoryNames = categories.data.data
                self.categoriesCollectionView.reloadData()
            case .failure(let er):
                print("failed to get main category")
                print(er)
            }
        }
    }
    
    func getCategoriesDetailes(index:Int) {
        
        AF.request(API.BASE_URL + "categories" + "/\(index)", method: .get , headers: HomeController.headers).responseDecodable(of: MainCategoriesDescription.self){ res in
            
            switch res.result {
            case .success(let categoriesDetailes):
                self.categoryDetailes = categoriesDetailes.data.data
                self.categoriesDetailesCollectionView.reloadData()
            case .failure(let er):
                print("failed to get main category detailes")
                print(er)
            }
        }
        
    }

}


extension HomeController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.categoriesCollectionView {
            return HomeController.categoryNames.count
        }else{
            return categoryDetailes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.categoriesCollectionView {
            CategoriesController.getCategoriesDetailesCount(index: HomeController.categoryNames[indexPath.row].id)
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.ID, for: indexPath) as! CategoriesCell
            cell.categoryTitle.text = HomeController.categoryNames[indexPath.row].name
            return cell
            
        }else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCell.ID, for: indexPath) as! ProductsCell
            cell.title.text = categoryDetailes[indexPath.row].name
            cell.price.text = "$ \(categoryDetailes[indexPath.row].price)"
            cell.image.kf.setImage(with: URL(string: categoryDetailes[indexPath.row].image))
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if collectionView == categoriesCollectionView {
            print("maincollectionviewtapped")
            getCategoriesDetailes(index: HomeController.categoryNames[indexPath.row].id)
        }else{
            print("3aaash ya bjoon")
        }
        
    }
    
}
