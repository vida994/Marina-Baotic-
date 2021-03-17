//
//  BaoticPricelistView.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 07.03.2021..
//

import UIKit

class BaoticPricelistView: UIView {
    
    let pricelist1 = UIImageView()
    var pricelist1Button = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title:String, icon: UIImage) {
        self.init(frame: .zero)
        DispatchQueue.main.async {
            self.pricelist1Button.setTitle(title, for: .normal)
            self.pricelist1.image = icon
        }
    }
    
    private func configure() {
        addSubview(pricelist1)
        addSubview(pricelist1Button)
        
        pricelist1.contentMode = .scaleAspectFit
        pricelist1Button.tintColor = .white
        pricelist1Button.backgroundColor = .clear
        pricelist1Button.titleLabel?.font = UIFont(name: "Baskerville", size: 20)
        pricelist1Button.contentHorizontalAlignment = .left
        
        
        pricelist1.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
        pricelist1.autoPinEdge(.top, to: .top, of: self, withOffset: 15)
        pricelist1.autoSetDimension(.height, toSize: 30)
        pricelist1.autoSetDimension(.width, toSize: 30)
        
        pricelist1Button.autoPinEdge(.top, to: .top, of: self, withOffset: 15)
        pricelist1Button.autoPinEdge(.left, to: .right, of: pricelist1, withOffset: 15)
        pricelist1Button.autoPinEdge(.right, to: .right, of: self, withOffset: -15)
        pricelist1.autoSetDimension(.height, toSize: 30)
        }
    
    func setActionForButton(vc:UIViewController, url: URL) {
        pricelist1Button.addAction(UIAction(handler: { (action) in
            self.pricelist1Button = action.sender as! UIButton
            vc.presentSafariVC(with: url)
        }), for: .touchUpInside)
    }
    
}
