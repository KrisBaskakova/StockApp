//
//  StockCell.swift
//  NewApp
//
//  Created by Кристина Баскакова on 21.12.2022.
//

import UIKit

final class StockTableViewCell: UITableViewCell {
  
  var priceOfStock = 4776.6
  var dynamicPrice = 55.5
  var persentageOfDymanic = 1.15

  lazy var containerView = UIView()
  private lazy var stockNameLabel = UILabel()
  private lazy var companyIconImageView = UIImageView()
  private lazy var companyNameLabel = UILabel()
  private lazy var stockPriceLabel = UILabel()
  private lazy var favouriteImage = UIImageView()
  private lazy var dynamicPriceLabel = UILabel()
  
  //MARK: - Init
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
 
  func set(model: StockModel) {
   stockNameLabel.text = model.name
   companyIconImageView.image = model.companyIcon
 }
  
  private func setupUI() {
    setupConfiguration()
    setupHierarchy()
    setupConstraints()
  }
  
  private func setupHierarchy() {
    addSubview(containerView)
    containerView.addSubview(stockNameLabel)
    containerView.addSubview(companyIconImageView)
    containerView.addSubview(companyNameLabel)
    containerView.addSubview(stockPriceLabel)
    containerView.addSubview(favouriteImage)
    containerView.addSubview(dynamicPriceLabel)
  }
  
  //MARK: - Configuretion
  
  private func setupConfiguration() {
    configurationContainerView()
    configureStockNameLabel()
    configureCompanyIconImageView()
    configureCompanyNameLabel()
    configureStockPriceLabel()
    configureFavouriteImage()
    configureDynamicPriceLabel()
  }
  
  private func configurationContainerView() {
    containerView.layer.cornerRadius = 16
  }
  
  private func configureStockNameLabel() {
    stockNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
  }
  
  private func configureCompanyNameLabel() {
    companyNameLabel.text = "Alphabet Class A"
    companyNameLabel.font = .systemFont(ofSize: 11, weight: .thin)
  }
  
  private func configureStockPriceLabel() {
    stockPriceLabel.text = "\(priceOfStock)"
    stockPriceLabel.font = .systemFont(ofSize: 18, weight: .bold)
  }
  
  private func configureCompanyIconImageView() {
    companyIconImageView.clipsToBounds = true
    companyIconImageView.layer.cornerRadius = 15
  }
  
  private func configureFavouriteImage() {
    favouriteImage.image = UIImage(named: "Path")
  }
  
  private func configureDynamicPriceLabel() {
    dynamicPriceLabel.text = "+\(dynamicPrice) P (\(persentageOfDymanic)%)"
    dynamicPriceLabel.font = .systemFont(ofSize: 12, weight: .medium)
    dynamicPriceLabel.textColor = UIColor(red: 0.14, green: 0.7, blue: 0.364, alpha: 1)
  }
  
  //MARK: - Constraints

  private func setupConstraints() {
    setupContainerViewConstraint()
    setStockNameLabelConstraints()
    setCompanyIconImageViewConstraints()
    setCompanyNameLabelConstraints()
    setStockPriceLabelConstraints()
    setStockFavouriteImageConstraints()
    setDynamicPriceLabelConstraints()
  }
  
  private func setupContainerViewConstraint() {
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
    containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
  }
  
  private func setCompanyIconImageViewConstraints() {
    companyIconImageView.translatesAutoresizingMaskIntoConstraints = false
    companyIconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
    companyIconImageView.heightAnchor.constraint(equalToConstant: 52).isActive = true
    companyIconImageView.widthAnchor.constraint(equalToConstant: 52).isActive = true
    companyIconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
  }
  
  
  private func setStockNameLabelConstraints() {
    stockNameLabel.translatesAutoresizingMaskIntoConstraints = false
    stockNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 14).isActive = true
    stockNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 72).isActive = true
  }
  
  private func setCompanyNameLabelConstraints() {
    companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
    companyNameLabel.topAnchor.constraint(equalTo: stockNameLabel.bottomAnchor, constant: 6).isActive = true
    companyNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 72).isActive = true
  }
  
  
  private func setStockPriceLabelConstraints() {
    stockPriceLabel.translatesAutoresizingMaskIntoConstraints = false
    stockPriceLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 14).isActive = true
    stockPriceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
  }
  
  private func setStockFavouriteImageConstraints() {
    favouriteImage.translatesAutoresizingMaskIntoConstraints = false
    favouriteImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
    favouriteImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
    favouriteImage.leadingAnchor.constraint(equalTo: stockNameLabel.trailingAnchor, constant: 6).isActive = true
    favouriteImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
  }
  
  private func setDynamicPriceLabelConstraints() {
    dynamicPriceLabel.translatesAutoresizingMaskIntoConstraints = false
    dynamicPriceLabel.topAnchor.constraint(equalTo: stockPriceLabel.bottomAnchor, constant: 0).isActive = true
    dynamicPriceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
  }
  
}


