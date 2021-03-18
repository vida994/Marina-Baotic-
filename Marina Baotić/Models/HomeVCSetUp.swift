//
//  HomeVCSetUp.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 18.03.2021..
//

import UIKit


class HomeVCSetUp {
    
    var vc: UIViewController?
    var scrollView: BaoticScrollView?
    var contentView: UIView?
    var logoImageView: UIImageView?
    var welcomeLabel: BaoticTitleLabel?
    var collectionViewContainer: BaoticBackgroundView?
    var collectionViewHeadline: BaoticHeadline1?
    var timerForShowScrollIndicator: Timer?
    
    var collectionView: UICollectionView!
    
    var contentfulManager: ContentfulManager?
    
    var weatherVC: WeatherView?
    var webshopView: WebshopView?
    var newsArray: [News]?
    
    
     func setUp(vc:UIViewController, scrollView:BaoticScrollView, contentView: UIView, logoImageView: UIImageView, welcomeLabel: BaoticTitleLabel, collectionViewContainer: BaoticBackgroundView, collectionViewHeadline: BaoticHeadline1, timerForShowScrollIndicator: Timer, collectionView: UICollectionView, contentfulManager: ContentfulManager, weatherVC: WeatherView, webshopView: WebshopView) {
        
        self.vc = vc; self.scrollView = scrollView; self.contentView = contentView; self.logoImageView = logoImageView; self.welcomeLabel = welcomeLabel; self.collectionViewContainer = collectionViewContainer; self.collectionViewHeadline = collectionViewHeadline; self.timerForShowScrollIndicator = timerForShowScrollIndicator; self.collectionView = collectionView; self.contentfulManager = contentfulManager; self.weatherVC = weatherVC; self.webshopView = webshopView
    }
    
    func setupViews() {
        guard let vc = vc, let scrollView = scrollView, let contentView = contentView else {
            return
        }
        DispatchQueue.main.async {
            vc.view.backgroundColor = Colors.mainColor
        }
        
        vc.configureBackgroundImage()
        vc.configureScrollView(scrollView: scrollView, contentView: contentView)
        configureLogoImageView()
        configureWelcomeLabel()
        configureWeatherView()
        configureNewsView()
        configureWebshopView()
    }
    
    func getNewsArticles(vc:UIViewController) {
        ContentfulManager.shared.getNewsArticles(vc: vc) { (result) in
            guard let result = result else {
                return
            }
            self.newsArray = result
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func resetScrollView() {
        DispatchQueue.main.async {
            self.scrollView?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        
    }
    
   private func configureLogoImageView() {
    guard let logoImageView = logoImageView, let contentView = contentView else {
        return
    }
        contentView.addSubview(logoImageView)
        logoImageView.image = Images.mainLogo
        logoImageView.contentMode = .scaleAspectFit
                
        logoImageView.autoPinEdge(.top, to: .top, of: contentView, withOffset: 20)
        logoImageView.autoPinEdge(.left, to: .left, of: contentView, withOffset: 30)
        logoImageView.autoSetDimension(.height, toSize: 48)
        logoImageView.autoSetDimension(.width, toSize: 135)
     }
    
    private func configureWelcomeLabel() {
        guard let welcomeLabel = welcomeLabel, let contentView = contentView, let logoImageView = logoImageView else {
            return
        }
        
        contentView.addSubview(welcomeLabel)
        welcomeLabel.text = "Welcome!"
        
        welcomeLabel.autoPinEdge(.top, to: .bottom, of: logoImageView, withOffset: 20)
        welcomeLabel.autoPinEdge(.left, to: .left, of: contentView, withOffset: 20)
        welcomeLabel.autoPinEdge(.right, to: .right, of: contentView, withOffset: -20)
        welcomeLabel.autoSetDimension(.height, toSize: 70)
    }
    
    private func configureWeatherView() {
        
        guard let weatherVC = weatherVC, let contentView = contentView, let welcomeLabel = welcomeLabel else {
            return
        }

        contentView.addSubview(weatherVC)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        weatherVC.conditionImage.isUserInteractionEnabled = true
        weatherVC.conditionImage.addGestureRecognizer(tapGestureRecognizer)

        weatherVC.autoPinEdge(.top, to: .bottom, of: welcomeLabel, withOffset: 20)
        weatherVC.autoPinEdge(.left, to: .left, of: contentView, withOffset: 20)
        weatherVC.autoPinEdge(.right, to: .right, of: contentView, withOffset: -20)
        weatherVC.autoSetDimension(.height, toSize: 128)
    }
    
    func configureNewsView() {
        configurecollectionViewContainer()
        configureCollectionViewHeadline()
        configureCollectionView()
        
    }
    
    func configurecollectionViewContainer() {
        
        guard let weatherVC = weatherVC, let contentView = contentView, let collectionViewContainer = collectionViewContainer else {
            return
        }
        
        contentView.addSubview(collectionViewContainer)
        
        collectionViewContainer.autoPinEdge(.top, to: .bottom, of: weatherVC, withOffset: 20)
        collectionViewContainer.autoPinEdge(.left, to: .left, of: contentView, withOffset: 20)
        collectionViewContainer.autoPinEdge(.right, to: .right, of: contentView, withOffset: -20)
        collectionViewContainer.autoSetDimension(.height, toSize: 320)
    }
    
    func configureCollectionViewHeadline() {
        
        guard let collectionViewHeadline = collectionViewHeadline, let contentView = contentView, let collectionViewContainer = collectionViewContainer else {
            return
        }
        
        collectionViewHeadline.text = "News and offers"
        contentView.addSubview(collectionViewHeadline)
        collectionViewHeadline.autoPinEdge(.top, to: .top, of: collectionViewContainer, withOffset: 20)
        collectionViewHeadline.autoPinEdge(.left, to: .left, of: collectionViewContainer, withOffset: 20)
        collectionViewHeadline.autoSetDimension(.height, toSize: 25)
        collectionViewHeadline.autoSetDimension(.width, toSize: 150)
    }
    
    func configureCollectionView() {
        //self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        
        guard let collectionView = self.collectionView, let contentView = contentView, let collectionViewContainer = collectionViewContainer, let collectionViewHeadline = collectionViewHeadline else {
            return
        }
        
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseID)
        collectionView.delegate = vc as? UICollectionViewDelegate
        collectionView.dataSource = vc as? UICollectionViewDataSource
        
        collectionView.autoPinEdge(.top, to: .bottom, of: collectionViewHeadline, withOffset: 0)
        collectionView.autoPinEdge(.left, to: .left, of: collectionViewContainer, withOffset: 0)
        collectionView.autoPinEdge(.right, to: .right, of: collectionViewContainer, withOffset: 0)
        collectionView.autoPinEdge(.bottom, to: .bottom, of: collectionViewContainer, withOffset: 0)
        
        
    }
    
    func configureWebshopView() {
        
        guard let webshopView = webshopView, let contentView = contentView, let collectionViewContainer = collectionViewContainer else {
            return
        }
        
        contentView.addSubview(webshopView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(webshopButtonTapped(tapGestureRecognizer:)))
        webshopView.button.isUserInteractionEnabled = true
        webshopView.button.addGestureRecognizer(tapGestureRecognizer)
        
        webshopView.autoPinEdge(.top, to: .bottom, of: collectionViewContainer, withOffset: 20)
        webshopView.autoPinEdge(.left, to: .left, of: contentView, withOffset: 20)
        webshopView.autoPinEdge(.right, to: .right, of: contentView, withOffset: -20)
        webshopView.autoSetDimension(.height, toSize: 85)
        webshopView.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -30)
        
    }

    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        vc!.presentSafariVC(with: URL(string: URLS.openWeatherURL)!)
    }
    
    @objc func webshopButtonTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        vc!.presentSafariVC(with: URL(string: URLS.marketURL)!)
    }
}


