//
//  WeatherView.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 02.03.2021..
//

import UIKit
import PureLayout

class WeatherView: UIView {
    
    let backgroundView = BaoticBackgroundView()
    let placeName = BaoticHeadline1(textAlligment: .left, fontSize: 20)
    let dateLabel = UILabel()
    var temperatureLabel = UILabel()
    var conditionImage = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        configureBackgroundView()
        configurePlaceName()
        configureDateLabel()
        configureTemperatureLabel()
        configureConditionImage()
        }
    
    private func configurePlaceName() {
        addSubview(placeName)
        placeName.text = "Seget Donji, Croatia"
        
        placeName.autoPinEdge(.top, to: .top, of: backgroundView, withOffset: 15)
        placeName.autoPinEdge(.left, to: .left, of: backgroundView, withOffset: 20)
        placeName.autoSetDimension(.height, toSize: 25)
    }
    
    private func configureTemperatureLabel() {
        addSubview(temperatureLabel)
        temperatureLabel.textColor = .white
        temperatureLabel.font = .systemFont(ofSize: 48, weight: .bold)
        temperatureLabel.text = ""
        
        temperatureLabel.autoPinEdge(.top, to: .bottom, of: dateLabel, withOffset: 5)
        temperatureLabel.autoPinEdge(.left, to: .left, of: backgroundView, withOffset: 20)
        temperatureLabel.autoSetDimension(.height, toSize: 55)
    }
    
    private func configureConditionImage() {
        addSubview(conditionImage)
        conditionImage.contentMode = .scaleAspectFit
        conditionImage.tintColor = .white
        
        conditionImage.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
        conditionImage.autoPinEdge(.right, to: .right, of: self, withOffset: -15)
        conditionImage.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -10)
        conditionImage.autoSetDimension(.width, toSize: 90)
    }
    
    
    private func configureDateLabel() {
        addSubview(dateLabel)
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "EEEE, MMM d"
        let stringDate = formatter.string(from: date)
        dateLabel.text = stringDate
        dateLabel.font = .systemFont(ofSize: 15, weight: .light)
        dateLabel.textColor = .white
        
        dateLabel.autoPinEdge(.top, to: .bottom, of: placeName, withOffset: 3)
        dateLabel.autoPinEdge(.left, to: .left, of: backgroundView, withOffset: 20)
        dateLabel.autoSetDimension(.height, toSize: 15)
    }
    
    private func configureBackgroundView() {
        addSubview(backgroundView)
        backgroundView.autoPinEdgesToSuperviewEdges()
       
    }
    
}


