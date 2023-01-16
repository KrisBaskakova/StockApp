//
//  SearchView.swift
//  NewApp
//
//  Created by Кристина Баскакова on 27.12.2022.
//

import UIKit

class SearchView: UIView {
  
  private lazy var searchImage = UIImageView()
  lazy var findLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    self.layer.cornerRadius = 20
    self.clipsToBounds = true
    self.layer.borderColor = UIColor.black.cgColor
    self.layer.borderWidth = 1.0
    setupHierarchy()
    setupConfiguration()
    setupConstraints()
  }
  
  private func setupHierarchy() {
    addSubview(searchImage)
    addSubview(findLabel)
  }
  
  private func setupConfiguration() {
    setupSearchImageConfiguration()
    setupFindLabelConfiguration()
  }
    
  private func setupSearchImageConfiguration() {
    searchImage.image = UIImage(named: "Ellipse 434")
  }
  
  private func setupFindLabelConfiguration() {
    findLabel.text = "Find company ot ticket"
    findLabel.font = .systemFont(ofSize: 16, weight: .bold)
  }

  func setupConstraints() {
    setupSearchImageConstraints()
    setupFindLableConstraints()
  }
  
  private func setupSearchImageConstraints() {
    searchImage.translatesAutoresizingMaskIntoConstraints = false
    searchImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    searchImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
    searchImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
    searchImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11).isActive = true
  }
  
  private func setupFindLableConstraints() {
    findLabel.translatesAutoresizingMaskIntoConstraints = false
    findLabel.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
    findLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11).isActive = true
    findLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19).isActive = true
    findLabel.leadingAnchor.constraint(equalTo: searchImage.trailingAnchor, constant: 13).isActive = true
  }
  
}
