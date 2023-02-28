//
//  NetworkService.swift
//  NewApp
//
//  Created by Кристина Баскакова on 16.01.2023.
//

import Foundation

final class NetworkService {
  
  func getStocks() -> [StockModel] {
    
    /*
     request...
     */
    
    let stocks = data
    
    return stocks
    
  }
  
}

private let data: [StockModel] = [
  StockModel(
    name: "AAPL",
    companyName: "Apple",
    companyIcon: Images.aaple,
    price: 217.93,
    dynamicPrice: 10
  ),
  StockModel(
    name: "AMZN",
    companyName: "Amazon",
    companyIcon: Images.amazon,
    price: 3117.93,
    dynamicPrice: 201
  ),
  StockModel(
    name: "GGOL",
    companyName: "Google",
    companyIcon: Images.google,
    price: 117.2,
    dynamicPrice: -15.2
  ),
  StockModel(
    name: "YNDX",
    companyName: "Yandex",
    companyIcon: Images.yandex,
    price: 102,
    dynamicPrice: 0.0
  ),
]
