//
//  ObjectDetailPhotosCell.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 07.03.2021..
//

import UIKit
import SDWebImage

class ObjectDetailPhotosCell: UICollectionViewCell {
    
    static let reuseID = "ObjectDetailPhotoCell"
    let objectImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(image: URL) {
        DispatchQueue.main.async {
            self.objectImage.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
            self.objectImage.sd_setImage(with: image, completed: nil)
        }
    }
    
    private func configure() {
        addSubview(objectImage)
        objectImage.contentMode = .scaleAspectFill
        objectImage.layer.cornerRadius = 5
        objectImage.clipsToBounds = true
        objectImage.autoPinEdgesToSuperviewEdges()
    }
    
}
