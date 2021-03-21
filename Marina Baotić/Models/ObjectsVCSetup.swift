//
//  ObjectsVCSetup.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 20.03.2021..
//

import UIKit

class ObjectsVCSetup {
    
    var vc: UIViewController?
    var collectionView: UICollectionView?
    var objects: [Object]?
    
    enum TypeOfObject: String {
        case gastro = "gastroObject"
        case service = "service"
    }
    
    func getObjects(typeOfObject:TypeOfObject, vc: UIViewController) {
        ContentfulManager.shared.getObjects(contentType: typeOfObject.rawValue, vc: vc) { (result) in
            guard let result = result else {
                return
            }
            self.objects = result
            DispatchQueue.main.async {
                self.collectionView!.reloadData()
            }
            
        }
    }
    
    func setUp(collectionView: UICollectionView, vc: UIViewController) {
        self.collectionView = collectionView; self.vc = vc
        vc.view.backgroundColor = Colors.mainColor
        vc.configureBackgroundImage()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createObjectFlowLayout())
        vc!.configureObjectCollectionView(collectionView: collectionView!)
        collectionView!.delegate = vc as? UICollectionViewDelegate
        collectionView!.dataSource = vc as? UICollectionViewDataSource
        }
}

