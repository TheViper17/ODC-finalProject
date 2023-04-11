//
//  OnboardingController.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 30/03/2023.
//

import UIKit

class OnboardingController: UIViewController{
    
    static let ID = String(describing: OnboardingController.self)
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var pageControllerOutlet: UIPageControl!
    
    var pageCells:[PageItem] = []
    
    var pageTitles = ["20% Discount New Arrival Product","Take Advantage Of The Offer Shopping ","All Types Offers Within Your Reach"]
    var pageDesc = ["Publish up your selfies to make yourself more beautiful with this app.", "Publish up your selfies to make yourself more beautiful with this app.","Publish up your selfies to make yourself more beautiful with this app."]
    var pageImgs = ["onBoarding1","onBoarding2","onBoarding3",]
    
    var currentPage = 0 {
        didSet{
            pageControllerOutlet.currentPage = currentPage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(true, forKey: "onBoardingVisited")
        setupData()
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
//        if currentPage == pageCells.count - 1{
//            print("Navigate")
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyBoard.instantiateViewController(withIdentifier: LoginController.ID) as! LoginController
//            self.navigationController?.pushViewController(vc, animated: true)
//        }else{
//            currentPage += 1
//            let indexPath = IndexPath(item: currentPage, section: 0)
//            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        }
        
        if SecondSplashController.loginSwitch {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: LoginController.ID) as! LoginController
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: SignupController.ID) as! SignupController
            self.navigationController?.pushViewController(vc, animated: true)
        }

        
    }
    
    func setupData(){
        for i in 1...pageTitles.count{
            pageCells.append(PageItem(pageImg: pageImgs[i - 1], pageTitle: pageTitles[i - 1], pageDesc: pageDesc[i - 1]))
        }
    }

}



extension OnboardingController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.ID, for: indexPath) as! OnboardingCell
        
        cell.setup(with: pageCells[indexPath.row])
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
