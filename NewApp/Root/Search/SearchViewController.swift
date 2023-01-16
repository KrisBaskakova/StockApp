//
//  SearchViewController.swift
//  NewApp
//
//  Created by Кристина Баскакова on 28.12.2022.
//

import UIKit

class SearchViewController: UIViewController {

  var backButton = UIButton()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setuoUI()
      backButton.addTarget(self, action: #selector(backButtonTaped), for: .touchUpInside)
      view.backgroundColor = .white
      backButton.backgroundColor = .blue
    }
  
  @objc func backButtonTaped() {
    dismiss(animated: true)
  }
  
  private func setuoUI() {
    setupHierarchy()
    setupConfiguration()
    setupConstraints()
  }
  
  private func setupHierarchy() {
    view.addSubview(backButton)
  }
  
  private func setupConfiguration() {
    setupBackButtonConfiguration()
  }
  
  private func setupBackButtonConfiguration() {
    backButton.setTitle("Back", for: .normal)
    backButton.setTitleColor(.blue, for: .normal)
  }
  
  private func setupConstraints() {
    setupBackButtonConstraints()
  }

  private func setupBackButtonConstraints() {
    backButton.translatesAutoresizingMaskIntoConstraints = false
    backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
   
  }
  
}
