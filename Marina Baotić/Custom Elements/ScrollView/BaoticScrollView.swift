//
//  BaoticScrollView.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 06.03.2021..
//

import UIKit

class BaoticScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func configure() {
        backgroundColor = .clear
        autoresizingMask = .flexibleHeight
        bounces = true
        showsVerticalScrollIndicator = true
        
        }
    
    func set(view:UIView, contentView:UIView) {
        addSubview(contentView)
        configure()
        contentView.backgroundColor = .clear
        contentView.autoPinEdge(.top, to: .top, of: self)
        contentView.autoPinEdge(.left, to: .left, of: self)
        contentView.autoPinEdge(.right, to: .right, of: self)
        contentView.autoPinEdge(.bottom, to: .bottom, of: self)
        contentView.autoSetDimension(.width, toSize: view.frame.width)
        contentView.autoSetDimension(.height, toSize: self.frame.height).priority = .defaultLow
        
    }
}
