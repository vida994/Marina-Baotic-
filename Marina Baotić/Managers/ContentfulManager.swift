//
//  ContentfulManager.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 04.03.2021..
//

import UIKit
import Contentful

class ContentfulManager {
    
    static let shared = ContentfulManager()
    
    let client = Client(spaceId: ContentfulKeys.spaceId, accessToken: ContentfulKeys.accessToken)
    
    func getEntries(contentType id: String, completion: @escaping(Result<[Entry], BaoticError>) -> Void) {
        
        let query = Query.where(contentTypeId: id)
        
        client.fetchArray(of: Entry.self, matching: query) { result in
            switch result {
            case .success(let array):
                completion(.success(array.items))
            
            case .failure( _):
                completion(.failure(.invalidData))
            }
        }
                
    }
    
    func getGastroObjects(contentType:String, vc:UIViewController, completion: @escaping(Result<[Object], BaoticError>) -> Void) {
        vc.showLoadingView()
        var objects = [Object]()
        ContentfulManager.shared.getEntries(contentType: contentType) { (result) in
            vc.dismissLoadingView()
            switch result {
            case .success(let gastroObjects):
                gastroObjects.forEach { (item) in
                    let gastroObject = Object(
                        headline: item.fields["headline"] as? String ?? "",
                        openingHours: item.fields["openingHours"] as? String,
                        mainImage: item.fields.linkedAsset(at: "mainImage")?.url ?? URL(string: "https://dl.dropbox.com/s/n3efhl7fa11f3wv/1603085475Marina-Baoti%C4%87-2020.jpg?dl=0")!,
                        shortDescription: item.fields["shortDescription"] as? String ?? "",
                        longDescription: item.fields["longDescription"] as? String ?? "",
                        pricelist1: item.fields.linkedAsset(at: "pricelist1")?.url,
                        pricelist2: item.fields.linkedAsset(at: "pricelist2")?.url,
                        imageAsstets: item.fields.linkedAssets(at: "selecetionImages"),
                        phoneNumber: item.fields["phoneNumber"] as? String ?? "+385912900057",
                        email: item.fields["email"] as? String ?? "reception@marinabaotic.com")
                    objects.append(gastroObject)
                    completion(.success(objects))
                }
                
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func getNewsArticles(vc:UIViewController, completion: @escaping(Result<[News], BaoticError>) -> Void) {
        vc.showLoadingView()
        var news = [News]()
        ContentfulManager.shared.getEntries(contentType: "newArticle") { (result) in
            vc.dismissLoadingView()
            switch result {
            case .success(let newsArticles):
                newsArticles.forEach { (item) in
                    let newsArticle = News(
                        headline: item.fields["headline"] as? String ?? "",
                        articleText: item.fields["articleText"] as? String ?? "",
                        articleImage: item.fields.linkedAsset(at: "articleImage")?.url ?? URL(string: "")!,
                        articleDestinationUrl: item.fields["articleDestinationUrl"] as? String ?? "https://www.baotic-yachting.com")
                    news.append(newsArticle)
                    completion(.success(news))
                }
                
            case .failure(let error):
                completion(.failure(error))
               
            }
        }
    }
    
   
}
