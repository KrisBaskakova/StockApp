//
//  Header.swift
//  NewApp
//
//  Created by Кристина Баскакова on 23.12.2022.
//

import UIKit

class StockListViewControllerHeader: UITableViewHeaderFooterView {
  
  private lazy var stockButton = UIButton()
  private lazy var favouriteButton = UIButton()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setupUI()
    stockButton.addTarget(self, action: #selector(stockButtonWasTapped), for: .touchUpInside)
    favouriteButton.addTarget(self, action: #selector(favouriteButtonWasTapped), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupHierarchy()
    configuration()
    setConstraints()
  }
  
  private func setupHierarchy() {
    addSubview(stockButton)
    addSubview(favouriteButton)
  }
  
  private func configuration() {
    configureStockButton()
    configureFavouriteButton()
  }
  
  private func configureStockButton() {
    stockButton.setTitle("Stocks", for: .normal)
    stockButton.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
    stockButton.setTitleColor(.black, for: .normal)
    stockButton.backgroundColor = .green
  }
  
  private func configureFavouriteButton() {
    favouriteButton.setTitle("Favourite", for: .normal)
    favouriteButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
    favouriteButton.setTitleColor(.black, for: .normal)
    favouriteButton.backgroundColor = .blue
  }
  
  private func setConstraints() {
    setStockButtonConstraints()
    setFavouriteButtonConstraints()
  }
  
  private func setStockButtonConstraints() {
    stockButton.translatesAutoresizingMaskIntoConstraints = false
    stockButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    stockButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
  }
  
  private func setFavouriteButtonConstraints() {
    favouriteButton.translatesAutoresizingMaskIntoConstraints = false
    favouriteButton.leadingAnchor.constraint(equalTo: stockButton.trailingAnchor, constant: 20).isActive = true
  }
  
}

//MARK: - Button actions

extension StockListViewControllerHeader {
  
  @objc func stockButtonWasTapped() {
    favouriteButton.setTitleColor(.gray, for: .normal)
    favouriteButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
    stockButton.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
    stockButton.setTitleColor(.black, for: .normal)
  }
  
  @objc func favouriteButtonWasTapped() {
    favouriteButton.setTitleColor(.black, for: .normal)
    favouriteButton.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
    stockButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
    stockButton.setTitleColor(.gray, for: .normal)
  }
  
}
