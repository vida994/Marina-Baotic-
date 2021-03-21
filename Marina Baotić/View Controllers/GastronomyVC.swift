//
//  GastronomyVC.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 06.03.2021..
//

import UIKit

class GastronomyVC: UIViewController {
    
    
    let objectsVCSetupModel = ObjectsVCSetup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objectsVCSetupModel.setUp(collectionView: UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createObjectFlowLayout()), vc: self)
        objectsVCSetupModel.getObjects(typeOfObject: .gastro, vc: self)
    }
    
    
}

extension GastronomyVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        let objectDetailVC = ObjectDetailVC(object: objectsVCSetupModel.objects![indexPath.row], typeOfObject: .gastro)
        navigationController?.pushViewController(objectDetailVC, animated: true)
    }
    
}
