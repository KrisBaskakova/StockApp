//
//  StockCardViewController.swift
//  NewApp
//
//  Created by Кристина Баскакова on 15.01.2023.
//

import UIKit

class StockDetailViewController: UIViewController {
  
  lazy var backButton = UIButton()
  lazy var favouriteButton = UIButton()
  lazy var buyButton = UIButton()
  let stockModel: StockModel
  
  init(stockModel: StockModel) {
    self.stockModel = stockModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    buttonsAction()
    view.backgroundColor = .white
  }
  
  //MARK: - Button actions
  
  private func buttonsAction() {
    backButton.addTarget(self, action: #selector(backButtonWasTapped), for: .touchUpInside)
    favouriteButton.addTarget(self, action: #selector(favouriteButtonWasTapped), for: .touchUpInside)
    buyButton.addTarget(self, action: #selector(buyButtonWasTapped), for: .touchUpInside)
  }
  
  @objc func buyButtonWasTapped() {
  }
  
  @objc func backButtonWasTapped() {
    self.navigationController?.popViewController(animated: true)
  }
  
  @objc func favouriteButtonWasTapped() {
    favouriteButton.setImage(UIImage(named: "goldStar"), for: .normal)
  }
  
  private func setupUI() {
    setupHeirarchy()
    setupConfiguration()
    setupConstraints()
  }
  
  private func setupHeirarchy() {
    view.addSubview(backButton)
    view.addSubview(favouriteButton)
    view.addSubview(buyButton)
  }
  
  //MARK: - Configuration
  
  private func setupConfiguration() {
    setupBackButtonConfiguration()
    setupFavouriteButtonConfiguration()
    setupBuyButtonConfiguration()
  }
  private func setupBuyButtonConfiguration() {
    buyButton.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
    buyButton.layer.cornerRadius = 16
    buyButton.clipsToBounds = true
    buyButton.setTitle("Buy for \(stockModel.price)", for: .normal)
    buyButton.setTitleColor(.white, for: .normal)
  }
  
  private func setupBackButtonConfiguration() {
    
    backButton.setImage(UIImage(named: "backArrow"), for: .normal)
  }
  
  private func setupFavouriteButtonConfiguration() {
    favouriteButton.setImage(UIImage(named: "whiteStar"), for: .normal)
  }
  
  //MARK: - Constraints
  
  private func setupConstraints() {
    setupBackbuttonConstrains()
    setupFavouriteButtonConstraints()
    setupBuyButtonConstraints()
    setupBuyButtonConstraints()
  }
  
  private func setupBuyButtonConstraints() {
    buyButton.translatesAutoresizingMaskIntoConstraints = false
    buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
    buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    buyButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
  }
  
  private func setupFavouriteButtonConstraints() {
    favouriteButton.translatesAutoresizingMaskIntoConstraints = false
    favouriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
    favouriteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 54).isActive = true
    favouriteButton.widthAnchor.constraint(equalToConstant: 22).isActive = true
    favouriteButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
  }
 
  private func setupBackbuttonConstrains() {
    backButton.translatesAutoresizingMaskIntoConstraints = false
    backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
    backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 57).isActive = true
    backButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    backButton.heightAnchor.constraint(equalToConstant: 14).isActive = true
  }
  
}
