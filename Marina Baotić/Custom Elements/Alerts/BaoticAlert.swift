//
//  BaoticAlert.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 03.03.2021..
//

import UIKit

struct BaoticAlert {
    static func showAlert(on vc:UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
