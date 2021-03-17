//
//  Object.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 07.03.2021..
//

import Foundation
import Contentful

struct Object {
    
    var headline: String?
    var openingHours: String?
    var mainImage: URL?
    var shortDescription: String?
    var longDescription: String?
    var pricelist1: URL?
    var pricelist2: URL?
    var imageAsstets: [Asset]?
    var phoneNumber: String?
    var email: String?
    
    var selecetionImages: [URL] {
        var urls = [URL]()
        imageAsstets?.forEach({ (item) in
            var url = URL(string: "")
            url = item.url ?? URL(string: "")
            urls.append(url!)
        })
        return urls
    }
}
