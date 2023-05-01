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
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var categoriesDetailesCollectionView: UICollectionView!
    
    @IBOutlet weak var homeSearch: UITextField!
    var textFieldVariable = ""
    
    static var categoryNames:[Description] = []
    var categoryDetailes:[DataDescription] = []
    var categoryDetailesSearch:[DataDescription] = []
    static let headers: HTTPHeaders = ["lang" : "en"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesDetailesCollectionView.delegate = self
        categoriesDetailesCollectionView.dataSource = self
        getMainCategories()
        homeSearch.addTarget(self, action: #selector(HomeController.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        textFieldVariable = homeSearch.text!
        
        if textFieldVariable.isEmpty {
            categoryDetailesSearch = categoryDetailes
            categoriesDetailesCollectionView.reloadData()
        }else{
            for i in 1...categoryDetailes.count{
                if categoryDetailes[i-1].name.uppercased().contains(textFieldVariable.uppercased()){
                    categoryDetailesSearch = categoryDetailes.filter({ ProductDetailes in
                        return (ProductDetailes.name.localizedCaseInsensitiveContains(textFieldVariable))
                    })
                }
            }
            categoriesDetailesCollectionView.reloadData()
        }
    }
    
    @IBAction func profileTapped(_ sender: Any) {
        print("profile tapped")
    }
    
    func getMainCategories() {
        
        AF.request(API.BASE_URL + "categories" , method: .get , headers: HomeController.headers).responseDecodable(of: MainCategoriesModel.self){ res in
            
            switch res.result {
            case .success(let categories):
                HomeController.categoryNames = categories.data.data
                CategoriesController.mainCategoryNames = categories.data.data
                self.categoriesCollectionView.reloadData()
                self.getCategoriesDetailes(index: HomeController.categoryNames[0].id)
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
            if textFieldVariable.isEmpty {
                return categoryDetailes.count
            }else{
                return categoryDetailesSearch.count
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.ID, for: indexPath) as! CategoriesCell
            cell.categoryTitle.text = HomeController.categoryNames[indexPath.row].name
            if indexPath.section == 0 && indexPath.row == 0 {
                cell.cellSelection()
            }
            return cell
            
        }else {
            if textFieldVariable.isEmpty {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCell.ID, for: indexPath) as! ProductsCell
                cell.title.text = categoryDetailes[indexPath.row].name
                cell.price.text = "$ \(categoryDetailes[indexPath.row].price)"
                cell.image.kf.setImage(with: URL(string: categoryDetailes[indexPath.row].image))
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCell.ID, for: indexPath) as! ProductsCell
                cell.title.text = categoryDetailesSearch[indexPath.row].name
                cell.price.text = "$ \(categoryDetailesSearch[indexPath.row].price)"
                cell.image.kf.setImage(with: URL(string: categoryDetailesSearch[indexPath.row].image))
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if collectionView == categoriesCollectionView {
            print("maincollectionviewtapped")
            getCategoriesDetailes(index: HomeController.categoryNames[indexPath.row].id)
            
            if let selectedCell = collectionView.cellForItem(at: indexPath) as? CategoriesCell {
                selectedCell.cellSelection()
            }
            
        }else{
            print("go to categories page to select an item")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if collectionView == categoriesCollectionView {
            print("maincollectionviewtapped")
            
            if let cellToDeselect = collectionView.cellForItem(at: indexPath) as? CategoriesCell {
                cellToDeselect.cellDeselection()
            }

            
        }else{
            print("go to categories page to select an item")
        }
    }
    
    
    
}
