//
//  StockCardViewController.swift
//  NewApp
//
//  Created by Кристина Баскакова on 15.01.2023.
//

import UIKit

class StockDetailViewController: UIViewController {

  
  private lazy var backButton = UIButton()
  lazy var favouriteButton = UIButton()
  lazy var buyButton = UIButton()
  private lazy var informationView = UIView()
  private lazy var stockNameLabel = UILabel()
  private lazy var companyNameLabel = UILabel()
  var details: [DetailsModel] = []
  let stockModel: StockModel
  let detailsTypeColleactionViewIdentifire = "detailsTypeColleactionView"
  let detailsTypeColleactionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let detailsTypeColleactionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    detailsTypeColleactionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "detailsTypeColleactionView")
    
    return detailsTypeColleactionView
  }()
  
  let cellData: [StockDetail] = [
    .chart,
    .summary,
    .news,
    .ideas,
    .forecast,
  ]
  
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
    setCollectionViewDelegates()
    stockNameLabel.backgroundColor = .red
    companyNameLabel.backgroundColor = .red
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
  
  // MARK: - UI settings
  
  private func setupUI() {
    setupHeirarchy()
    setupConfiguration()
    setupConstraints()
  }
  
  private func setCollectionViewDelegates() {
    detailsTypeColleactionView.delegate = self
    detailsTypeColleactionView.dataSource = self
  }
  
  private func setupHeirarchy() {
    view.addSubview(stockNameLabel)
    view.addSubview(companyNameLabel)
    view.addSubview(backButton)
    view.addSubview(favouriteButton)
    view.addSubview(buyButton)
    view.addSubview(detailsTypeColleactionView)
    view.addSubview(informationView)
  }
  
  //MARK: - Configuration
  
  private func setupConfiguration() {
    setupBackButtonConfiguration()
    setupFavouriteButtonConfiguration()
    setupBuyButtonConfiguration()
    setupStockNameLabelConfiguration()
    setupCompanyNameLabelConfiguration()
  }
  
  
  private func setupStockNameLabelConfiguration(){
    stockNameLabel.text = stockModel.name
    stockNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
    stockNameLabel.textAlignment = .center
    stockNameLabel.numberOfLines = 0
  }
  
  private func setupCompanyNameLabelConfiguration(){
    companyNameLabel.text = stockModel.companyName
    companyNameLabel.font = .systemFont(ofSize: 12, weight: .regular)
    companyNameLabel.textAlignment = .center
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
    setupStockNameLabelConstraints()
    setupFavouriteButtonConstraints()
    setupBuyButtonConstraints()
    setupBuyButtonConstraints()
    setupCompanyNameLabelConstraints()
    setupDetailsTypeStackViewConstraints()
    setupSummaruViewConstraints()
  }
  
  private func setupSummaruViewConstraints() {
    informationView.translatesAutoresizingMaskIntoConstraints = false
    informationView.topAnchor.constraint(equalTo: detailsTypeColleactionView.bottomAnchor, constant: 20).isActive = true
    informationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    informationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    informationView.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -16).isActive = true
  }

  private func setupStockNameLabelConstraints(){
    stockNameLabel.translatesAutoresizingMaskIntoConstraints = false
    stockNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
    stockNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  private func setupCompanyNameLabelConstraints(){
    companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
    companyNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    companyNameLabel.widthAnchor.constraint(equalToConstant: 62).isActive = true
    companyNameLabel.topAnchor.constraint(equalTo: stockNameLabel.bottomAnchor, constant: 4).isActive = true
  }
  
  private func setupDetailsTypeStackViewConstraints() {
    detailsTypeColleactionView.translatesAutoresizingMaskIntoConstraints = false
    detailsTypeColleactionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 108).isActive = true
    detailsTypeColleactionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    detailsTypeColleactionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    detailsTypeColleactionView.heightAnchor.constraint(equalToConstant: 25).isActive = true
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

//MARK: - CollectionView Extension

extension StockDetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: collectionView.bounds.width / 4, height: 40)
    }
  
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cellData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsTypeColleactionView", for: indexPath) as! DetailCollectionViewCell
    
    cell.configure(with: cellData[indexPath.row])
    cell.backgroundColor = .cyan
    cell.layer.borderWidth = 1
  
    
    switch indexPath.row {
    case 0:
      informationView.backgroundColor = .gray
    case 1:
      informationView.backgroundColor = .green
    case 2:
      informationView.backgroundColor = .blue
    case 3:
      informationView.backgroundColor = .red
    case 4:
      informationView.backgroundColor = .brown
    default:
      UICollectionViewCell()
    }
    
    return cell
  }
}
