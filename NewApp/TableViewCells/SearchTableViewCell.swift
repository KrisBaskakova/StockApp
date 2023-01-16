//
//  SearchTableViewCell.swift
//  NewApp
//
//  Created by Кристина Баскакова on 27.12.2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

  lazy var searchView = SearchView()
  lazy var searchButton = UIButton()
  
  var didTapToSearchButtonClosure: (() -> Void)? = nil
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    searchButton.addTarget(self, action: #selector(searchButtonWasTapped), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupHierarchy()
    setupSearchViewConstraints()
    setupSearchButtonConstraints()
  }
  
  private func setupHierarchy() {
    contentView.addSubview(searchView)
    contentView.addSubview(searchButton)
  }
  
  private func setupSearchViewConstraints() {
    searchView.translatesAutoresizingMaskIntoConstraints = false
    searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    searchView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    searchView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    searchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    searchView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
  }
  
  private func setupSearchButtonConstraints() {
    
    searchButton.translatesAutoresizingMaskIntoConstraints = false
    searchButton.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: 0).isActive = true
    searchButton.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 0).isActive = true
    searchButton.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 0).isActive = true
    searchButton.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 0).isActive = true
  }
  
}

extension SearchTableViewCell {
  
  @objc func searchButtonWasTapped() {
    didTapToSearchButtonClosure?()
  }
}
