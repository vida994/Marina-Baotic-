//
//  WebCamsVC.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 11.03.2021..
//

import UIKit

class WebCamsVC: UIViewController {
    
    let webcamVCSetupModel = WebcamsVCSetUp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        webcamVCSetupModel.configureUI()
        
    }
    
    private func setUp() {
        webcamVCSetupModel.setUp(vc: self, chooseLabel: BaoticTitleLabel(textAlligment: .left, fontSize: 30), segmentedControl: UISegmentedControl(), cameraPreviewImage: UIImageView(), currentlySelected: BaoticTitleLabel(textAlligment: .center, fontSize: 25), message: BaoticHeadline1(textAlligment: .center, fontSize: 15))
    }
    
}
