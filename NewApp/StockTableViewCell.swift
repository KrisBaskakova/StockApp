//
//  StockCell.swift
//  NewApp
//
//  Created by Кристина Баскакова on 21.12.2022.
//

import UIKit

final class StockTableViewCell: UITableViewCell {

  
  private var stockNameLabel = UILabel()
  private var companyIconImageView = UIImageView()
  private var companyNameLabel = UILabel()
  private var stockPriceLabel = UILabel()
  private var favouriteImage = UIImageView()
  private var dynamicPriceLabel = UILabel()
  var priceOfStock = 4776.6
  var dynamicPrice = 55.5
  var persentageOfDymanic = 1.15
  
  //MARK: - Init

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(stockNameLabel)
    addSubview(companyIconImageView)
    addSubview(companyNameLabel)
    addSubview(stockPriceLabel)
    addSubview(favouriteImage)
    addSubview(dynamicPriceLabel)
    
    configureStockNameLabel()
    configureCompanyIconImageView()
    configureCompanyNameLabel()
    configureStockPriceLabel()
    configureFavouriteImage()
    configureDynamicPriceLabel()
    
    setStockNameLabelConstraints()
    setcompanyIconImageViewConstraints()
    setCompanyNameLabelConstraints()
    setStockPriceLabelConstraints()
    setStockFavouriteImageConstraints()
    setDynamicPriceLabelConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Configuretion
  
  func set(stocks: Stocks) {
    stockNameLabel.text = stocks.stockName
    companyIconImageView.image = stocks.companyIcon
  }
  
  func configureStockNameLabel() {
    stockNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
  }
  
  func configureCompanyNameLabel() {
    companyNameLabel.text = "Alphabet Class A"
    companyNameLabel.font = .systemFont(ofSize: 11, weight: .thin)
  }
  
  func configureStockPriceLabel() {
    stockPriceLabel.text = "\(priceOfStock)"
    stockPriceLabel.font = .systemFont(ofSize: 18, weight: .bold)
  }
  
  func configureCompanyIconImageView() {
    companyIconImageView.clipsToBounds = true
    companyIconImageView.layer.cornerRadius = 15
  }
  
  func configureFavouriteImage() {
    favouriteImage.image = UIImage(named: "Path")
  }
  
  func configureDynamicPriceLabel() {
    dynamicPriceLabel.text = "+\(dynamicPrice) P (\(persentageOfDymanic)%)"
    dynamicPriceLabel.font = .systemFont(ofSize: 12, weight: .thin)
    dynamicPriceLabel.textColor = .green
  }
  
  //MARK: - Constraints
  
  func setcompanyIconImageViewConstraints() {
    companyIconImageView.translatesAutoresizingMaskIntoConstraints = false
    companyIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
    companyIconImageView.heightAnchor.constraint(equalToConstant: 52).isActive = true
    companyIconImageView.widthAnchor.constraint(equalToConstant: 52).isActive = true
    companyIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
  }
  
  
  func setStockNameLabelConstraints() {
    stockNameLabel.translatesAutoresizingMaskIntoConstraints = false
    stockNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
    stockNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 72).isActive = true
  }
  
  func setCompanyNameLabelConstraints() {
    companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
    companyNameLabel.topAnchor.constraint(equalTo: stockNameLabel.bottomAnchor, constant: 6).isActive = true
    companyNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 72).isActive = true
  }
  
  
  func setStockPriceLabelConstraints() {
    stockPriceLabel.translatesAutoresizingMaskIntoConstraints = false
    stockPriceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
    stockPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
  func setStockFavouriteImageConstraints() {
    favouriteImage.translatesAutoresizingMaskIntoConstraints = false
    favouriteImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
    favouriteImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
    favouriteImage.leadingAnchor.constraint(equalTo: stockNameLabel.trailingAnchor, constant: 6).isActive = true
    favouriteImage.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
  }
  
  func setDynamicPriceLabelConstraints() {
    dynamicPriceLabel.translatesAutoresizingMaskIntoConstraints = false
    dynamicPriceLabel.topAnchor.constraint(equalTo: stockPriceLabel.bottomAnchor, constant: 0).isActive = true
    dynamicPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
}


