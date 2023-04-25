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
    
    @IBOutlet weak var categoriesSearch: UITextField!
    var textFieldVariable = ""
    
    static var mainCategoryNames:[Description] = []
    static var mainCategoryNamesSearch:[Description] = []
    
    //static var numberOfItems : Int = 0
    //static var numberOfItems : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.reloadData()
        categoriesSearch.addTarget(self, action: #selector(CategoriesController.textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        textFieldVariable = categoriesSearch.text!
        
        if textFieldVariable.isEmpty {
            CategoriesController.mainCategoryNamesSearch = CategoriesController.mainCategoryNames
            collectionViewOutlet.reloadData()
        }else{
            for i in 1...CategoriesController.mainCategoryNames.count{
                if CategoriesController.mainCategoryNames[i-1].name.uppercased().contains(textFieldVariable.uppercased()){
                    CategoriesController.mainCategoryNamesSearch = CategoriesController.mainCategoryNames.filter({ ProductDetailes in
                        return (ProductDetailes.name.localizedCaseInsensitiveContains(textFieldVariable))
                    })
                }
            }
            collectionViewOutlet.reloadData()
        }
    }
    
//    static func getCategoriesDetailesCount(index:Int) {
//
//        AF.request(API.BASE_URL + "categories" + "/\(index)", method: .get , headers: HomeController.headers).responseDecodable(of: MainCategoriesDescription.self){ res in
//
//            switch res.result {
//            case .success(let categoriesDetailes):
//                CategoriesController.numberOfItems.append(categoriesDetailes.data.data.count)
//            case .failure(let er):
//                print("failed to get main category detailes")
//                print(er)
//            }
//        }
//
//    }

    
}

extension CategoriesController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if textFieldVariable.isEmpty {
            return CategoriesController.mainCategoryNames.count
        }else{
            return CategoriesController.mainCategoryNamesSearch.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if textFieldVariable.isEmpty{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesPageCell.ID, for: indexPath) as! CategoriesPageCell
            cell.title.text = CategoriesController.mainCategoryNames[indexPath.row].name
            //cell.productsNumber.text = "\(CategoriesController.numberOfItems[indexPath.row]) products"
            cell.productsNumber.text = "products"
            cell.image.kf.setImage(with: URL(string: CategoriesController.mainCategoryNames[indexPath.row].image))
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesPageCell.ID, for: indexPath) as! CategoriesPageCell
            cell.title.text = CategoriesController.mainCategoryNamesSearch[indexPath.row].name
            //cell.productsNumber.text = "\(CategoriesController.numberOfItems[indexPath.row]) products"
            cell.productsNumber.text = "products"
            cell.image.kf.setImage(with: URL(string: CategoriesController.mainCategoryNamesSearch[indexPath.row].image))
            return cell
        }
        

        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let vc = storyboard?.instantiateViewController(withIdentifier: CategoriesPageController.ID) as! CategoriesPageController
        vc.getCategoriesDetailesData(index: HomeController.categoryNames[indexPath.row].id)
        vc.pageTitle = "\(HomeController.categoryNames[indexPath.row].name)"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
