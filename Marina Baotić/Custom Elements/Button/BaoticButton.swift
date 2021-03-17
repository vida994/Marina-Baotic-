//
//  BaoticButton.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 08.03.2021..
//

import UIKit
import MessageUI

class BaoticButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title:String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    func setActionForCall(url:URL) {
        addAction(UIAction(handler: { (action) in
            UIApplication.shared.open(url, options: [:]) { (sucess) in
    
            }
            
        }), for: .touchUpInside)
    }

    
}
