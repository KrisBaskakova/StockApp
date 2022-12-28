//
//  SearchTableViewCell.swift
//  NewApp
//
//  Created by Кристина Баскакова on 27.12.2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

  lazy var searchView = SearchView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupHierarchy()
    setupSearchViewConstraints()
  }
  
  private func setupHierarchy() {
    addSubview(searchView)
  }
  
  private func setupSearchViewConstraints() {
    searchView.translatesAutoresizingMaskIntoConstraints = false
    searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    searchView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
    searchView.heightAnchor.constraint(equalToConstant: 48).isActive = true
  }
  
}
