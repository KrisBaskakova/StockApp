//
//  StockListPresenter.swift
//  NewApp
//
//  Created by Кристина Баскакова on 09.02.2023.
//

import Foundation

// MARK: - Protocols

protocol stockListPresenterProtocol: AnyObject {
  init(view: stockListViewProtocol, model: StockModel)
}

protocol stockListViewProtocol: AnyObject {
  
  func testAction()
}


// MARK:  - Stock List Presenter

class stockListPresenter: stockListPresenterProtocol {
  
  let stockListView: stockListViewProtocol
  let model: StockModel
  
  required init(view: stockListViewProtocol, model: StockModel) {
    self.stockListView = view
    self.model = model
  }
  
}
