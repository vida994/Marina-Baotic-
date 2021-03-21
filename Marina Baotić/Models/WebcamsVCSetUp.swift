//
//  WebcamsVCSetUp.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 20.03.2021..
//

import UIKit

class WebcamsVCSetUp {
    
    var vc: UIViewController?
    var chooseLabel: BaoticTitleLabel?
    var segmentedControl: UISegmentedControl?
    var cameraPreviewImage: UIImageView?
    var currentlySelected: BaoticTitleLabel?
    var message: BaoticHeadline1?
    
    func setUp(vc: UIViewController, chooseLabel: BaoticTitleLabel, segmentedControl: UISegmentedControl, cameraPreviewImage: UIImageView, currentlySelected: BaoticTitleLabel, message: BaoticHeadline1) {
        
        self.vc = vc; self.chooseLabel = chooseLabel; self.segmentedControl = segmentedControl; self.cameraPreviewImage = cameraPreviewImage; self.currentlySelected = currentlySelected; self.message = message
    }
    
    func configureUI() {
        
        guard let vc = vc else {
            return
        }
        
        vc.view.backgroundColor = Colors.mainColor
        vc.configureBackgroundImage()
        configureChooseLabel()
        configureSegmentedControl()
        configureImage()
        configureCurrentlySelected()
        configureMessageLabel()
    }
    
    func configureChooseLabel() {
        
        guard let vc = vc, let chooseLabel = chooseLabel else {
            return
        }
        
        vc.view.addSubview(chooseLabel)
        chooseLabel.text = "Choose webcam:"
        chooseLabel.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 50), excludingEdge: .bottom)
      }
    
    func configureSegmentedControl() {
        guard let vc = vc, let segmentedControl = segmentedControl, let cameraPreviewImage = cameraPreviewImage, let currentlySelected = currentlySelected, let chooseLabel = chooseLabel else {
            return
        }
        vc.view.addSubview(segmentedControl)
        segmentedControl.tintColor = .white
        segmentedControl.overrideUserInterfaceStyle = .dark
        segmentedControl.insertSegment(action: UIAction(title: "", image: Images.segmentedControlMarinaIcon, identifier: nil, discoverabilityTitle: "", attributes: .disabled, state: .on, handler: { (action) in
            DispatchQueue.main.async {
                cameraPreviewImage.image = Images.segmentedControlMarinaImage
                currentlySelected.text = "Marina Webcam"
            }
        }), at: 0, animated: true)
        segmentedControl.insertSegment(action: UIAction(title: "", image: Images.segmentedControlGasIcon, identifier: nil, discoverabilityTitle: "", attributes: .disabled, state: .on, handler: { (action) in
            DispatchQueue.main.async {
                cameraPreviewImage.image = Images.segmentedControlGasImage
                currentlySelected.text = "Gas station Webcam"
            }
        }), at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.autoPinEdge(.left, to: .left, of: vc.view, withOffset: 20)
        segmentedControl.autoPinEdge(.top, to: .bottom, of: chooseLabel, withOffset: 5)
        segmentedControl.autoPinEdge(.right, to: .right, of: vc.view, withOffset: -20)
        
    }
    
    func configureImage() {
        guard let vc = vc, let segmentedControl = segmentedControl, let cameraPreviewImage = cameraPreviewImage else {
            return
        }
        vc.view.addSubview(cameraPreviewImage)
        cameraPreviewImage.contentMode = .scaleAspectFill
        cameraPreviewImage.layer.cornerRadius = 8
        cameraPreviewImage.clipsToBounds = true
        cameraPreviewImage.image = Images.segmentedControlMarinaImage
        
        cameraPreviewImage.autoPinEdge(.left, to: .left, of: vc.view, withOffset: 20)
        cameraPreviewImage.autoPinEdge(.top, to: .bottom, of: segmentedControl, withOffset: 10)
        cameraPreviewImage.autoPinEdge(.right, to: .right, of: vc.view, withOffset: -20)
        cameraPreviewImage.autoSetDimension(.height, toSize: 200)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        cameraPreviewImage.isUserInteractionEnabled = true
        cameraPreviewImage.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        guard let vc = vc, let segmentedControl = segmentedControl else {
            return
        }
        
        if segmentedControl.selectedSegmentIndex == 0 {
            vc.presentSafariVC(with: URL(string: URLS.marinaWebcamURL)!)
        }
        else if segmentedControl.selectedSegmentIndex == 1 {
            vc.presentSafariVC(with: URL(string: URLS.gasWebcamURL)!)
        }
        
    }
    
    func configureCurrentlySelected() {
        guard let vc = vc, let cameraPreviewImage = cameraPreviewImage, let currentlySelected = currentlySelected else {
            return
        }
        vc.view.addSubview(currentlySelected)
        currentlySelected.text = "Marina Webcam"
        
        currentlySelected.autoPinEdge(.left, to: .left, of: vc.view, withOffset: 20)
        currentlySelected.autoPinEdge(.top, to: .bottom, of: cameraPreviewImage, withOffset: 10)
        currentlySelected.autoPinEdge(.right, to: .right, of: vc.view, withOffset: -20)
        
    }
    
    func configureMessageLabel() {
        guard let vc = vc, let message = message, let currentlySelected = currentlySelected else {
            return
        }
        
        vc.view.addSubview(message)
        message.text = "After playing, please wait few seconds for stream to load."
        message.numberOfLines = 0
        
        message.autoPinEdge(.left, to: .left, of: vc.view, withOffset: 20)
        message.autoPinEdge(.top, to: .bottom, of: currentlySelected, withOffset: 20)
        message.autoPinEdge(.right, to: .right, of: vc.view, withOffset: -20)
    }
    
}
