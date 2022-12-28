//
//  SearchView.swift
//  NewApp
//
//  Created by Кристина Баскакова on 27.12.2022.
//

import UIKit

class SearchView: UIView {
  
  private lazy var searchImage = UIImageView()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
    setupHierarchy()
    setupSearchImageConfiguration()
    setupConstraints()
  }

  private func setupUI() {
    self.layer.cornerRadius = 16
    self.clipsToBounds = true
    self.layer.borderColor = UIColor.black.cgColor
    self.layer.borderWidth = 3.0
  }
  
  private func setupHierarchy() {
    addSubview(searchImage)
  }
    
  
  private func setupSearchImageConfiguration() {
    searchImage.image = UIImage(named: "Ellipse 434")
  }

  func setupConstraints() {
    setupViewConstraints()
    setupSearchImageConstraints()
  }
  
  private func setupViewConstraints() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.bottomAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
    self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
  }
  
  private func setupSearchImageConstraints() {
    searchImage.translatesAutoresizingMaskIntoConstraints = false
    searchImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    searchImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
    searchImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
  }
  
}
