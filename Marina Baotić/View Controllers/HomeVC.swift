//
//  HomeVC.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 02.03.2021..
//

import UIKit

class HomeVC: UIViewController {
    
    
    let homeVCSetUpModel = HomeVCSetUp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpModel()
        setupViews()
        homeVCSetUpModel.getNewsArticles(vc: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        WeatherManager.shared.getWeather(weatherVC: homeVCSetUpModel.weatherVC!, vc: self)
        homeVCSetUpModel.resetScrollView()
        
    }
    
    private func setUpModel() {
        homeVCSetUpModel.setUp(vc: self, scrollView: BaoticScrollView(), contentView: UIView(), logoImageView: UIImageView(), welcomeLabel: BaoticTitleLabel(textAlligment: .left, fontSize: 68), collectionViewContainer: BaoticBackgroundView(), collectionViewHeadline: BaoticHeadline1(textAlligment: .left, fontSize: 20), timerForShowScrollIndicator: Timer(), collectionView: UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout()), contentfulManager: ContentfulManager(), weatherVC: WeatherView(), webshopView: WebshopView())
    }
    
    private func setupViews() {
        DispatchQueue.main.async {
            self.homeVCSetUpModel.setupViews()
        }
    }
    
    
}

// MARK: - CollectionView Protocol Methods

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeVCSetUpModel.newsArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseID, for: indexPath) as! NewsCell
        
        cell.set(news: homeVCSetUpModel.newsArray![indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedArticle = homeVCSetUpModel.newsArray![indexPath.row]
        
        presentSafariVC(with: URL(string: selectedArticle.articleDestinationUrl!)!)
    }
    
    
}

