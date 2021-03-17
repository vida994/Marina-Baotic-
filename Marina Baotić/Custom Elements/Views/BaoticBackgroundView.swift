//
//  BaoticBackgroundView.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 04.03.2021..
//

import UIKit

class BaoticBackgroundView: UIView {
    
    let backgroundView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(background: UIView) {
        super.init(frame: .zero)
        background.autoPinEdgesToSuperviewEdges()
    }
    
    private func configure() {
        addSubview(backgroundView)
        backgroundView.layer.cornerRadius = 12
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.4
        
        backgroundView.autoPinEdgesToSuperviewEdges()
       
    }
}
