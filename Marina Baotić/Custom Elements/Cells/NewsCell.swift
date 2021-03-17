//
//  NewsCell.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 03.03.2021..
//

import UIKit
import SDWebImage

class NewsCell: UICollectionViewCell {
    
    static let reuseID = "NewsCell"
    let newsImage = UIImageView()
    let newsHeadline = BaoticHeadline1(textAlligment: .left, fontSize: 17)
    let newsPreviewText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(news:News) {
        DispatchQueue.main.async {
            self.newsHeadline.text = news.headline
            self.newsPreviewText.text = news.articleText
            self.newsImage.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
            self.newsImage.sd_setImage(with: news.articleImage!, completed: nil)
        }
    }
    
    
    
    private func configure() {
        addSubview(newsImage)
        addSubview(newsHeadline)
        addSubview(newsPreviewText)
        configureNewsPreviewText()
        newsImage.contentMode = .scaleAspectFill
        newsImage.layer.cornerRadius = 5
        newsImage.clipsToBounds = true
        newsHeadline.numberOfLines = 2
        contentView.backgroundColor = .clear
        
        
        newsImage.autoPinEdge(.top, to: .top, of: contentView, withOffset: 10)
        newsImage.autoPinEdge(.left, to: .left, of: contentView, withOffset: 0)
        newsImage.autoPinEdge(.right, to: .right, of: contentView, withOffset: -10)
        newsImage.autoSetDimension(.height, toSize: 120)
        
        newsHeadline.autoPinEdge(.top, to: .bottom, of: newsImage, withOffset: 10)
        newsHeadline.autoPinEdge(.left, to: .left, of: contentView, withOffset: 0)
        newsHeadline.autoPinEdge(.right, to: .right, of: contentView, withOffset: -10)
        newsHeadline.autoSetDimension(.height, toSize: 45)
        
        newsPreviewText.autoPinEdge(.top, to: .bottom, of: newsHeadline, withOffset: 10)
        newsPreviewText.autoPinEdge(.left, to: .left, of: contentView, withOffset: 0)
        newsPreviewText.autoPinEdge(.right, to: .right, of: contentView, withOffset: -10)
        //newsPreviewText.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -20)
        newsPreviewText.autoSetDimension(.height, toSize: 70, relation: .lessThanOrEqual)
        
    }
    
    func configureNewsPreviewText() {
        newsPreviewText.textColor = .white
        newsPreviewText.font = .systemFont(ofSize: 14, weight: .regular)
        newsPreviewText.numberOfLines = 3
        
    }
}
