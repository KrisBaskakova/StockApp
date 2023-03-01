//
//  DetailCollectionViewCell.swift
//  NewApp
//
//  Created by Кристина Баскакова on 10.02.2023.
//

import UIKit

final class DetailCollectionViewCell: UICollectionViewCell {
  
  private lazy var title = UILabel()
 
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configure
  
  func configure(with type: StockDetail) {
    title.text = type.rawValue
  }
  
  
  // MARK: - SetupUI
  
  func setupUI() {
    addSubview(title)
    title.translatesAutoresizingMaskIntoConstraints = false
    title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    title.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
    title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
  }
  
}
