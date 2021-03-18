//
//  ServicesVC.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 10.03.2021..
//

import UIKit
import Hero

class ServicesVC: UIViewController {

    var collectionView: UICollectionView!
    var serviceObjects = [Object]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getObjects()
        
        
    }
    
    
    private func setupViews() {
        view.backgroundColor = Colors.mainColor
        configureBackgroundImage()
        configureCollectionView()
    }
    
    
    
    func getObjects() {
        ContentfulManager.shared.getGastroObjects(contentType: "service", vc: self) { (result) in
            switch result {
            case .success(let objects):
                self.serviceObjects = objects
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    BaoticAlert.showAlert(on: self, title: "There is a problem.", message: error.rawValue)
                }
            }
        }
    }
    
    

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createObjectFlowLayout())
        configureObjectCollectionView(collectionView: collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
                
        }

    
}

extension ServicesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return serviceObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ObjectCell.reuseID, for: indexPath) as! ObjectCell
        
        cell.updateCell(gastroObject: serviceObjects[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let objectDetailVC = ObjectDetailVC(object: serviceObjects[indexPath.row], typeOfObject: .service)
        navigationController?.pushViewController(objectDetailVC, animated: true)
    }

}
