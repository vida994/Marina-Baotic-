//
//  ObjectCell.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 06.03.2021..
//

import UIKit
import SDWebImage

class ObjectCell: UICollectionViewCell {
    
    static let reuseID = "ObjectCell"
    let background = BaoticBackgroundView()
    var objectHeadline = BaoticHeadline1(textAlligment: .left, fontSize: 20)
    var objectDescription = UILabel()
    let objectImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        configureBackgroundView()
        configureImage()
        configureHeadline()
        configureDescription()
    }
    
    func updateCell(gastroObject:Object) {
        
        DispatchQueue.main.async { 
            self.objectImage.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
            self.objectImage.sd_setImage(with: gastroObject.mainImage!, completed: nil)
            
            self.objectHeadline.text = gastroObject.headline
            self.objectDescription.text = gastroObject.shortDescription
        }
    }
    
    private func configureImage() {
        addSubview(objectImage)
        objectImage.layer.cornerRadius = 5
        objectImage.clipsToBounds = true
        objectImage.contentMode = .scaleAspectFill
        objectImage.autoPinEdge(.top, to: .top, of: background, withOffset: 15)
        objectImage.autoPinEdge(.right, to: .right, of: background, withOffset: -15)
        objectImage.autoPinEdge(.bottom, to: .bottom, of: background, withOffset: -15)
        objectImage.autoSetDimension(.width, toSize: 175)
    }
    
    private func configureHeadline() {
        addSubview(objectHeadline)
        objectHeadline.numberOfLines = 0
        objectHeadline.autoPinEdge(.top, to: .top, of: self, withOffset: 13)
        objectHeadline.autoPinEdge(.left, to: .left, of: self, withOffset: 15)
        objectHeadline.autoPinEdge(.right, to: .left, of: objectImage, withOffset: -15)
    }
    
    private func configureDescription() {
        addSubview(objectDescription)
        objectDescription.numberOfLines = 0
        objectDescription.textColor = .white
        objectDescription.font = .systemFont(ofSize: 15, weight: .regular)
        objectDescription.autoPinEdge(.top, to: .bottom, of: objectHeadline, withOffset: 0)
        objectDescription.autoPinEdge(.left, to: .left, of: self, withOffset: 15)
        objectDescription.autoPinEdge(.right, to: .left, of: objectImage, withOffset: -15)
        objectDescription.autoSetDimension(.height, toSize: 80, relation: .lessThanOrEqual)
    }
    
    private func configureBackgroundView() {
        addSubview(background)
        background.autoPinEdgesToSuperviewEdges()
       
    }
}
