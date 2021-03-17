//
//  WebCamsVC.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 11.03.2021..
//

import UIKit

class WebCamsVC: UIViewController {
    
    let chooseLabel = BaoticTitleLabel(textAlligment: .left, fontSize: 30)
    let segmentedControl = UISegmentedControl()
    let cameraPreviewImage = UIImageView()
    let currentlySelected = BaoticTitleLabel(textAlligment: .center, fontSize: 25)
    let message = BaoticHeadline1(textAlligment: .center, fontSize: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
         
    }
    
    func configureUI() {
        view.backgroundColor = Colors.mainColor
        configureBackgroundImage()
        configureChooseLabel()
        configureSegmentedControl()
        configureImage()
        configureCurrentlySelected()
        configureMessageLabel()
    }
    
    func configureChooseLabel() {
        
        view.addSubview(chooseLabel)
        chooseLabel.text = "Choose webcam:"
        chooseLabel.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 50), excludingEdge: .bottom)
      }
    
    func configureSegmentedControl() {
        view.addSubview(segmentedControl)
        segmentedControl.tintColor = .white
        segmentedControl.overrideUserInterfaceStyle = .dark
        segmentedControl.insertSegment(action: UIAction(title: "", image: Images.segmentedControlMarinaIcon, identifier: nil, discoverabilityTitle: "", attributes: .disabled, state: .on, handler: { (action) in
            DispatchQueue.main.async {
                self.cameraPreviewImage.image = Images.segmentedControlMarinaImage
                self.currentlySelected.text = "Marina Webcam"
            }
        }), at: 0, animated: true)
        segmentedControl.insertSegment(action: UIAction(title: "", image: Images.segmentedControlGasIcon, identifier: nil, discoverabilityTitle: "", attributes: .disabled, state: .on, handler: { (action) in
            DispatchQueue.main.async {
                self.cameraPreviewImage.image = Images.segmentedControlGasImage
                self.currentlySelected.text = "Gas station Webcam"
            }
        }), at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.autoPinEdge(.left, to: .left, of: view, withOffset: 20)
        segmentedControl.autoPinEdge(.top, to: .bottom, of: chooseLabel, withOffset: 5)
        segmentedControl.autoPinEdge(.right, to: .right, of: view, withOffset: -20)
        
    }
    
    func configureImage() {
        view.addSubview(cameraPreviewImage)
        cameraPreviewImage.contentMode = .scaleAspectFill
        cameraPreviewImage.layer.cornerRadius = 8
        cameraPreviewImage.clipsToBounds = true
        cameraPreviewImage.image = Images.segmentedControlMarinaImage
        
        cameraPreviewImage.autoPinEdge(.left, to: .left, of: view, withOffset: 20)
        cameraPreviewImage.autoPinEdge(.top, to: .bottom, of: segmentedControl, withOffset: 10)
        cameraPreviewImage.autoPinEdge(.right, to: .right, of: view, withOffset: -20)
        cameraPreviewImage.autoSetDimension(.height, toSize: 200)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        cameraPreviewImage.isUserInteractionEnabled = true
        cameraPreviewImage.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            presentSafariVC(with: URL(string: URLS.marinaWebcamURL)!)
        }
        else if segmentedControl.selectedSegmentIndex == 1 {
            presentSafariVC(with: URL(string: URLS.gasWebcamURL)!)
        }
        
    }
    
    func configureCurrentlySelected() {
        view.addSubview(currentlySelected)
        currentlySelected.text = "Marina Webcam"
        
        currentlySelected.autoPinEdge(.left, to: .left, of: view, withOffset: 20)
        currentlySelected.autoPinEdge(.top, to: .bottom, of: cameraPreviewImage, withOffset: 10)
        currentlySelected.autoPinEdge(.right, to: .right, of: view, withOffset: -20)
        
    }
    
    func configureMessageLabel() {
        view.addSubview(message)
        message.text = "After playing, please wait few seconds for stream to load."
        message.numberOfLines = 0
        
        message.autoPinEdge(.left, to: .left, of: view, withOffset: 20)
        message.autoPinEdge(.top, to: .bottom, of: currentlySelected, withOffset: 20)
        message.autoPinEdge(.right, to: .right, of: view, withOffset: -20)
    }
    
    

}
