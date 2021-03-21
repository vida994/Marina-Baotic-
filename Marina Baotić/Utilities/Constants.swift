//
//  Constants.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 02.03.2021..
//

import UIKit

enum Images {
    static let background = UIImage(named: "mainBackground")
    static let mainLogo = UIImage(named: "mainLogo")
    static let homeTabBar = UIImage(systemName: "house")
    static let gastronomyTabBar = UIImage(named: "Restaurant")
    static let serviceTabBar = UIImage(systemName: "person.fill")
    static let webcamsTabBar = UIImage(systemName: "video.fill")
    static let pricelistFood = UIImage(named: "food")
    static let pricelistDrinks = UIImage(named: "Wine Glass")
    static let pricelistGeneral = UIImage(named: "Paper")
    static let segmentedControlMarinaIcon = UIImage(named: "marina")
    static let segmentedControlGasIcon = UIImage(named: "gas")
    static let segmentedControlMarinaImage = UIImage(named: "marinageneral")
    static let segmentedControlGasImage = UIImage(named: "gasstation")
}

enum Colors {
    static let mainColor = #colorLiteral(red: 0, green: 0.1098039216, blue: 0.2392156863, alpha: 1)
}

enum ContentfulKeys {
    static let spaceId = "h21udw8o0fby"
    static let accessToken = "Kvm8vc4FNWuZugNqhMJH9c3q9GAWIlKIFY2up2EXhBA"
}

enum URLS {
    static let openWeatherURL = "https://openweathermap.org/city/3188763"
    static let marketURL = "https://marinabaoticmarket.com"
    static let marinaWebcamURL = "https://v.angelcam.com/iframe?v=xblm9n5ny2&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb21haW4iOiJ3d3cuYmFvdGljLXlhY2h0aW5nLmNvbSIsImNhbWVyYV9pZCI6Nzc2NzksImV4cCI6MTYxMzIzOTY0N30.teivA2MxvFa2cq9N1QuAn5SlPmBU4NOT1YT4PoEyUNY"
    static let gasWebcamURL = "https://v.angelcam.com/iframe?v=2dl628p5yk&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb21haW4iOiJ3d3cuYmFvdGljLXlhY2h0aW5nLmNvbSIsImNhbWVyYV9pZCI6ODAyMDUsImV4cCI6MTYxMzIzOTkyN30.syNh6QwBWIk6idENkBT7Au4LAD9BLJL2jzqLbFWNXE8"
}

enum Fonts {
    static let objectHeadline = UIFont(name: "Baskerville", size: 30)
}

enum TypeOfEmail {
    case reservation, inquiry
}
