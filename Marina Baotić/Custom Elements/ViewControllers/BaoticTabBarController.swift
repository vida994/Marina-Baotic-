//
//  BaoticTabBarController.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 02.03.2021..
//

import UIKit

class BaoticTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0, green: 0.1098039216, blue: 0.2392156863, alpha: 1)
        viewControllers = [createHomeVC(),createGastronomyVC(),createServiceVC(),createWebCamsVC()]
        // Do any additional setup after loading the view.
    }
    
    func createHomeVC() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: Images.homeTabBar, tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createGastronomyVC() -> UINavigationController {
        let gastronomyVC = GastronomyVC()
        gastronomyVC.title = "Gastronomy"
        gastronomyVC.tabBarItem = UITabBarItem(title: "Gastronomy", image: Images.gastronomyTabBar, tag: 1)
        return UINavigationController(rootViewController: gastronomyVC)
    }
    
    func createServiceVC() -> UINavigationController {
        let serviceVC = ServicesVC()
        serviceVC.title = "Services"
        serviceVC.tabBarItem = UITabBarItem(title: "Services", image: Images.serviceTabBar, tag: 2)
        return UINavigationController(rootViewController: serviceVC)
    }
    
    func createWebCamsVC() -> UINavigationController {
        let webCamsVC = WebCamsVC()
        webCamsVC.title = "Web Cams"
        webCamsVC.tabBarItem = UITabBarItem(title: "Web Cams", image: Images.webcamsTabBar, tag: 3)
        return UINavigationController(rootViewController: webCamsVC)
    }
    
    
}
