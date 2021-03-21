//
//  ServicesVC.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 10.03.2021..
//

import UIKit

class ServicesVC: UIViewController {
    
    let objectsVCSetupModel = ObjectsVCSetup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objectsVCSetupModel.setUp(collectionView: UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createObjectFlowLayout()), vc: self)
        objectsVCSetupModel.getObjects(typeOfObject: .service, vc: self)
    }
    
    
}

extension ServicesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return gastroObjects.count
        return objectsVCSetupModel.objects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ObjectCell.reuseID, for: indexPath) as! ObjectCell
        
        //cell.updateCell(gastroObject: gastroObjects[indexPath.row])
        cell.updateCell(gastroObject: objectsVCSetupModel.objects![indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let objectDetailVC = ObjectDetailVC(object: gastroObjects[indexPath.row], typeOfObject: .gastro)
        let objectDetailVC = ObjectDetailVC(object: objectsVCSetupModel.objects![indexPath.row], typeOfObject: .service)
        navigationController?.pushViewController(objectDetailVC, animated: true)
    }
    
}
