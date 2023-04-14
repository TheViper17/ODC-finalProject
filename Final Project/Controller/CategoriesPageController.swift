//
//  CategoriesPageController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 03/04/2023.
//

import UIKit
import Kingfisher
import Alamofire

class CategoriesPageController: UIViewController {
    
    static let ID = String(describing: CategoriesPageController.self)
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    @IBOutlet weak var categoryTitle: UILabel!
    static var categoryPageDetailes:[DataDescription] = []
    var pageTitle = "Title"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        categoryTitle.text = pageTitle
        
    }
    
    
    func getCategoriesDetailesData(index:Int) {

        AF.request(API.BASE_URL + "categories" + "/\(index)", method: .get , headers: HomeController.headers).responseDecodable(of: MainCategoriesDescription.self){ res in

            //print("into number call")
            switch res.result {
            case .success(let categoriesDetailes):
                CategoriesPageController.categoryPageDetailes = categoriesDetailes.data.data
                //print(categoriesDetailes.data.data.count)
            case .failure(let er):
                print("failed to get main category detailes")
                print(er)
            }
            self.collectionViewOutlet.reloadData()
        }

    }
    
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension CategoriesPageController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoriesPageController.categoryPageDetailes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsPageCell.ID, for: indexPath) as! ProductsPageCell
        cell.title.text = CategoriesPageController.categoryPageDetailes[indexPath.row].name
        cell.price.text = "$ \(CategoriesPageController.categoryPageDetailes[indexPath.row].price)"
        cell.image.kf.setImage(with: URL(string: CategoriesPageController.categoryPageDetailes[indexPath.row].image))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let vc = storyboard?.instantiateViewController(withIdentifier: ProductsDescriptionController.ID) as! ProductsDescriptionController
        vc.item = CategoriesPageController.categoryPageDetailes[indexPath.row]
//        vc.pageCells.append(CategoriesPageController.categoryPageDetailes[indexPath.row].image)
//        vc.pageCells.append(contentsOf: CategoriesPageController.categoryPageDetailes[indexPath.row].images)
//        vc.pageItemTitle = CategoriesPageController.categoryPageDetailes[indexPath.row].name
//        vc.pageItemDescription = CategoriesPageController.categoryPageDetailes[indexPath.row].description
//        vc.pageItemPrice = "$ \(CategoriesPageController.categoryPageDetailes[indexPath.row].price)"
//        vc.itemID = HomeController.categoryNames[indexPath.row].id
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
