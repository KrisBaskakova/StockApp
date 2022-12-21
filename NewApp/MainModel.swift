//
//  MainModel.swift
//  NewApp
//
//  Created by Кристина Баскакова on 20.12.2022.
//

import UIKit



struct StockCellModel {
  let stockName: String
  let companyName: String
  let companyIcon: UIImage
  let stockPrice: Double
  let dynamicPrice: Bool
  let favourite: Bool
}


struct Stocks {
  let stockName: String
  let companyIcon: UIImage
}


struct Images {
  
  static let aaple = UIImage(named: "AAPL")!
  static let amazon = UIImage(named: "AMZN")!
  static let google = UIImage(named: "GOOGL")!
  static let yandex = UIImage(named: "YNDX")!
  static let star = UIImage(named: "Path")!
  
}
