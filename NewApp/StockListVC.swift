//
//  StockListVC.swift
//  NewApp
//
//  Created by Кристина Баскакова on 21.12.2022.
//

import UIKit

class StockListVC: UIViewController {
  
  var tableView = UITableView()
  var stocks: [Stocks] = []
  
  struct Cells {
    
    static let StockCell = "StockCell"
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Stocks"
    stocks = fetchData()
    tableView.register(StockTableViewCell.self, forCellReuseIdentifier: Cells.StockCell)
    configureTableView()
    
  }
  
  
  func configureTableView() {
    view.addSubview(tableView)
    setTableViewDelegates()
    tableView.rowHeight = 68
    tableView.pin(to: view)
  }
  
  func setTableViewDelegates() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
}

extension StockListVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: Cells.StockCell) as! StockTableViewCell
    let stock = stocks[indexPath.row]
    cell.set(stocks: stock)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stocks.count
  }
  
}


extension StockListVC {
  
  private func fetchData() -> [Stocks] {
    let stock1 = Stocks(stockName: "Apple", companyIcon: Images.aaple)
    let stock2 = Stocks(stockName: "Amazon", companyIcon: Images.amazon)
    let stock3 = Stocks(stockName: "Google", companyIcon: Images.google)
    let stock4 = Stocks(stockName: "Yandex", companyIcon: Images.yandex)
    let stock5 = Stocks(stockName: "Star", companyIcon: Images.star)
    
    return [stock1, stock2, stock3, stock4, stock5]
    
  }
  
}


