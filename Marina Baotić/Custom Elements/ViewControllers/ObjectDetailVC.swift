//
//  ObjectDetailVC.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 07.03.2021..
//

import UIKit

class ObjectDetailVC: UIViewController {
    
    enum TypeOfObject {
        case gastro, service
    }
    
    
    var scrollView = BaoticScrollView()
    var contentView = UIView()
    
    let objectHeadline = UILabel()
    let clockImage = UIImageView()
    let openingHours = UILabel()
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createObjectsDetailImagesFlowLayout())
    let pageControl = UIPageControl()
    let objectDescription = UILabel()
    let pricelist1 = BaoticPricelistView()
    let pricelist2 = BaoticPricelistView(title: "View Drinks Menu", icon: Images.pricelistDrinks!)
    var buttonsStackView = UIStackView()
    let buttonOne = BaoticButton(title: "Call now")
    let buttonTwo = BaoticButton(title: "Send inquiry")
    
    
    var object:Object?

    init(object:Object,typeOfObject: TypeOfObject) {
        super.init(nibName: nil, bundle: nil)
        self.object = object
        
        if typeOfObject == .gastro {
            pricelist1.pricelist1Button.setTitle("View Menu", for: .normal)
            pricelist1.pricelist1.image = Images.pricelistFood
        }
        else {
            pricelist1.pricelist1Button.setTitle("View Price list", for: .normal)
            pricelist1.pricelist1.image = Images.pricelistGeneral
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.mainColor
        configureBackgroundImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViews()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / view.frame.width
            pageControl.currentPage = Int(scrollPos)
    }
    
    
    private func configureViews() {
        configureScrollView(scrollView: scrollView, contentView: contentView)
        configureHeadline()
        configureClockImage()
        configureOpeningHours()
        configurecollectionView()
        congfigurePageControl()
        configureObjectDescription()
        configurePricelist1()
        configurePricelist2()
        configureStackView()
        
    }
    
    
    private func configureHeadline() {
        contentView.addSubview(objectHeadline)
        objectHeadline.text = object?.headline
        objectHeadline.textColor = .white
        objectHeadline.font = Fonts.objectHeadline
        objectHeadline.textAlignment = .left
        objectHeadline.autoPinEdge(toSuperviewSafeArea: .left, withInset: 15)
        objectHeadline.autoPinEdge(toSuperviewSafeArea: .top, withInset: 15)
    }
    
    private func configureClockImage() {
        
        guard object?.openingHours != nil else {
            clockImage.isHidden = true
            return
        }
        
        contentView.addSubview(clockImage)
        clockImage.contentMode = .scaleAspectFit
        clockImage.tintColor = .white
        clockImage.image = UIImage(systemName: "clock")
        clockImage.autoPinEdge(.top, to: .bottom, of: objectHeadline, withOffset: 10)
        clockImage.autoPinEdge(toSuperviewSafeArea: .left, withInset: 15)
        clockImage.autoSetDimension(.height, toSize: 20)
        clockImage.autoSetDimension(.width, toSize: 20)
        
    }
    
    private func configureOpeningHours() {
        guard object?.openingHours != nil else {
            openingHours.isHidden = true
            return
        }
        contentView.addSubview(openingHours)
        openingHours.text = "Opening hours: \(object!.openingHours!)"
        openingHours.textColor = .white
        openingHours.font = .systemFont(ofSize: 17, weight: .regular)
        openingHours.textAlignment = .left
        openingHours.numberOfLines = 0
        openingHours.autoPinEdge(.left, to: .right, of: clockImage, withOffset: 10)
        openingHours.autoPinEdge(.top, to: .bottom, of: objectHeadline, withOffset: 10)
        openingHours.autoPinEdge(toSuperviewSafeArea: .right, withInset: -15)
    }
    
    private func configurecollectionView() {
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.register(ObjectDetailPhotosCell.self, forCellWithReuseIdentifier: ObjectDetailPhotosCell.reuseID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        
        if  object?.imageAsstets?.count == 1 {
            collectionView.isScrollEnabled = false
            pageControl.isHidden = true
        }
        
        if object?.openingHours == nil {
            collectionView.autoPinEdge(.top, to: .bottom, of: objectHeadline, withOffset: 15)
        }
        else {
            collectionView.autoPinEdge(.top, to: .bottom, of: openingHours, withOffset: 15)
        }
        
        collectionView.autoPinEdge(.left, to: .left, of: contentView, withOffset: 15)
        collectionView.autoPinEdge(.right, to: .right, of: contentView, withOffset: -15)
        collectionView.autoSetDimension(.height, toSize: 210)
    }
    
    private func congfigurePageControl() {
        addPageControl(view: collectionView, object: object!, pageControl: pageControl)
    }
    
    private func configureObjectDescription() {
        contentView.addSubview(objectDescription)
        objectDescription.text = object?.longDescription
        objectDescription.textColor = .white
        objectDescription.font = .systemFont(ofSize: 17, weight: .regular)
        objectDescription.textAlignment = .left
        objectDescription.numberOfLines = 0
        
        objectDescription.autoPinEdge(.top, to: .bottom, of: collectionView, withOffset: 20)
        objectDescription.autoPinEdge(.left, to: .left, of: contentView, withOffset: 15)
        objectDescription.autoPinEdge(.right, to: .right, of: contentView, withOffset: -15)
    }
    
    private func configurePricelist1() {
        guard object?.pricelist1 != nil else {
            pricelist1.isHidden = true
            return
        }
        contentView.addSubview(pricelist1)
        
        pricelist1.autoPinEdge(.top, to: .bottom, of: objectDescription, withOffset: 15)
        pricelist1.autoPinEdge(.left, to: .left, of: contentView, withOffset: 15)
        pricelist1.autoPinEdge(.right, to: .right, of: contentView, withOffset: -15)
        pricelist1.autoSetDimension(.height, toSize: 50)
        
        
        pricelist1.setActionForButton(vc: self, url: (object?.pricelist1)!)
    }
    
    private func configurePricelist2() {
        guard object?.pricelist2 != nil else {
            pricelist2.isHidden = true
            return
        }
        contentView.addSubview(pricelist2)
        if pricelist1.isHidden == true {
            pricelist2.autoPinEdge(.top, to: .bottom, of: objectDescription, withOffset: 10)
        }
        else {
            pricelist2.autoPinEdge(.top, to: .bottom, of: pricelist1, withOffset: 5)
        }
        
        pricelist2.autoPinEdge(.left, to: .left, of: contentView, withOffset: 15)
        pricelist2.autoPinEdge(.right, to: .right, of: contentView, withOffset: -15)
        pricelist2.autoSetDimension(.height, toSize: 50)
        pricelist2.setActionForButton(vc: self, url: (object?.pricelist2)!)
    }
    
    private func configureStackView() {
        contentView.addSubview(buttonsStackView)
        if pricelist1.isHidden == true && pricelist2.isHidden == true {
            buttonsStackView.autoPinEdge(.top, to: .bottom, of: objectDescription, withOffset: 20)
        }
        
        else if pricelist2.isHidden == true {
            buttonsStackView.autoPinEdge(.top, to: .bottom, of: pricelist1, withOffset: 20)
        }
        else {
            buttonsStackView.autoPinEdge(.top, to: .bottom, of: pricelist2, withOffset: 20)
        }
        buttonsStackView.addArrangedSubview(buttonOne)
        buttonsStackView.addArrangedSubview(buttonTwo)
        buttonsStackView.alignment = .center
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 20
        
        buttonOne.setActionForCall(url: URL(string: object!.phoneNumber!)!)
        buttonTwo.addAction(UIAction(handler: { [weak self](action) in
            guard let self = self else { return}
            self.showMailComposer(object: self.object!, mailSubject: "Reservation", typeOfMail: .reservation)
        }), for: .touchUpInside)
        
        
        
        
        buttonsStackView.autoPinEdge(.left, to: .left, of: contentView, withOffset: 15)
        buttonsStackView.autoPinEdge(.right, to: .right, of: contentView, withOffset: -15)
        buttonsStackView.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -30)
    }
}

extension ObjectDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return object?.selecetionImages.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ObjectDetailPhotosCell.reuseID, for: indexPath) as! ObjectDetailPhotosCell
        
        let imageForDisplay = object?.selecetionImages[indexPath.row]
        
        cell.setCell(image: imageForDisplay!)
        
        return cell
    }
    
    
}
