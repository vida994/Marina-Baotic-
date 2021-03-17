//
//  WebshopView.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 04.03.2021..
//

import UIKit

class WebshopView: UIView {
    
    let background = BaoticBackgroundView()
    let webshopIcon = UIImageView()
    let headline = BaoticHeadline1(textAlligment: .left, fontSize: 20)
    let text = UILabel()
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(background)
        addSubview(webshopIcon)
        addSubview(headline)
        addSubview(text)
        addSubview(button)
        
        webshopIcon.image = UIImage(named: "shopping-cart")
        webshopIcon.contentMode = .scaleAspectFit
        
        headline.text = "Marina Baotić Webshop"
        headline.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        text.text = "Shop groceries online with free delivery to your boat."
        text.numberOfLines = 2
        text.font = .systemFont(ofSize: 15, weight: .regular)
        text.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        button.backgroundColor = .clear
        
        background.autoPinEdgesToSuperviewEdges()
        webshopIcon.autoPinEdgesToSuperviewEdges(with: .init(top: 10, left: 20, bottom: 10, right: 0), excludingEdge: .right)
        webshopIcon.autoSetDimension(.width, toSize: 50)
        
        headline.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
        headline.autoPinEdge(.right, to: .right, of: self, withOffset: -10)
        headline.autoPinEdge(.left, to: .right, of: webshopIcon, withOffset: 20)
        headline.autoSetDimension(.height, toSize: 20)
        
        text.autoPinEdge(.top, to: .bottom, of: headline, withOffset: 5)
        text.autoPinEdge(.right, to: .right, of: self, withOffset: -10)
        text.autoPinEdge(.left, to: .right, of: webshopIcon, withOffset: 20)
        text.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -10)
        
        button.autoPinEdgesToSuperviewEdges()
    }
    
    
}
