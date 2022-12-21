//
//  StockCell.swift
//  NewApp
//
//  Created by Кристина Баскакова on 21.12.2022.
//

import UIKit

class StockTableViewCell: UITableViewCell {
  
  var stockNameLabel = UILabel()
  var companyIconImageView = UIImageView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(stockNameLabel)
    addSubview(companyIconImageView)
    configureStockNameLabel()
    configureCompanyIconImageView()
    setStockNameLabelConstraints()
    setcompanyIconImageViewConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(stocks: Stocks) {
    stockNameLabel.text = stocks.stockName
    companyIconImageView.image = stocks.companyIcon
  }
  
  func configureStockNameLabel() {
    stockNameLabel.text = "Yandex"
    stockNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
  }
  
  func configureCompanyIconImageView() {
    companyIconImageView.layer.cornerRadius = 8
    companyIconImageView.clipsToBounds = false
  }
  
  
  func setcompanyIconImageViewConstraints() {
    
    companyIconImageView.translatesAutoresizingMaskIntoConstraints = false
    companyIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
    companyIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
    companyIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -268).isActive = true
    companyIconImageView.heightAnchor.constraint(equalToConstant: 52).isActive = true
  }
  
  
  func setStockNameLabelConstraints() {
    stockNameLabel.translatesAutoresizingMaskIntoConstraints = false
    stockNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
    stockNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 72).isActive = true
    stockNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 30).isActive = true
    stockNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -202).isActive = true
    
  }
  
  
}
