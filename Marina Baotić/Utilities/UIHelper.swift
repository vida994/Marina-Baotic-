//
//  UIHelper.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 03.03.2021..
//

import UIKit

struct UIHelper {
    
    static func createHomeFlowLayout() -> UICollectionViewLayout {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 180, height: 270)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        return layout
        
    }
    
    static func createObjectFlowLayout() -> UICollectionViewLayout {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 340, height: 150)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        return layout
        
    }
    
    static func createObjectsDetailImagesFlowLayout() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 370, height: 200)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        return layout
    }
    
}
