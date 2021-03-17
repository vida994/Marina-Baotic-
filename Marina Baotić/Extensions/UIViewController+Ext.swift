//
//  UIViewController+Ext.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 02.03.2021..
//

import UIKit
import SafariServices
import MessageUI

fileprivate var containerView: UIView!

extension UIViewController {
    
    func configureBackgroundImage() {
        let backgroundView = UIImageView()
        view.addSubview(backgroundView)
        backgroundView.image = Images.background
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndicatore = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicatore)
        
        activityIndicatore.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatore.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicatore.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        activityIndicatore.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
        }
        
    }
    
    func presentSafariVC(with url:URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .white
        safariVC.preferredBarTintColor = Colors.mainColor
        present(safariVC, animated: true, completion: nil)
    }
    
    func configureScrollView(scrollView: BaoticScrollView, contentView: UIView) {
        view.addSubview(scrollView)
        scrollView.autoPinEdgesToSuperviewSafeArea()
        scrollView.set(view: self.view, contentView: contentView)
        
    }
    
    func configureObjectCollectionView(collectionView: UICollectionView) {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.register(ObjectCell.self, forCellWithReuseIdentifier: ObjectCell.reuseID)
        collectionView.autoPinEdgesToSuperviewSafeArea(with: .init(top: 0, left: 20, bottom: 20, right: 20))
        }
    
    func addPageControl(view:UIView, object:Object, pageControl: UIPageControl) {
        self.view.addSubview(pageControl)
        pageControl.numberOfPages = object.imageAsstets!.count
        pageControl.currentPage = 0
        
        pageControl.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: -10)
        pageControl.autoPinEdge(.left, to: .left, of: view, withOffset: 20)
        pageControl.autoPinEdge(.right, to: .right, of: view, withOffset: -20)
        
    }
    
   
    
    func showMailComposer(object:Object, mailSubject:String, typeOfMail: TypeOfEmail) {
        
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.setToRecipients(["\(object.email!)"])
        composer.setSubject("\(mailSubject) for \(object.headline!)")
        if typeOfMail == .reservation {
            composer.setMessageBody("""
                \(mailSubject) for \(object.headline!),
                
                Name:
                Number of persons:
                For date:
                Hour: *(example: 18:30)
                
                ///////////////////////
                - Automatic notification
                Reservation confirmation will be send within an hour to your email if reservation is possible.
                ///////////////////////
                """
                , isHTML: false)
        }
        else {
            composer.setMessageBody("""
                \(mailSubject) for \(object.headline!),
                
                *Delete this line and insert your inquriy.
                
                """
                , isHTML: false)
        }
        
        present(composer, animated: true, completion: nil)
    }
    
    
}
