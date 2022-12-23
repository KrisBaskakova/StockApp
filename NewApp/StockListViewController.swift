//
//  StockListVC.swift
//  NewApp
//
//  Created by Кристина Баскакова on 21.12.2022.
//

import UIKit

final class StockListViewController: UIViewController {
  
  private lazy var tableView = UITableView()
  private lazy var stocks: [Stock] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    stocks = fetchData()
    tableView.register(StockTableViewCell.self, forCellReuseIdentifier: "StockCell")
    configureTableView()
  }

  func configureTableView() {
    view.addSubview(tableView)
    setTableViewDelegates()
    tableView.rowHeight = 76
    tableView.pin(to: view)
  }
  
  func setTableViewDelegates() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension StockListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
  
    let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell") as! StockTableViewCell
    let stock = stocks[indexPath.row]
    cell.set(stock: stock)
    cell.layer.cornerRadius = 8
    
    
    if indexPath.row % 2 == 0 {
      cell.containerView.backgroundColor = .white
    } else {
      cell.containerView.backgroundColor = .gray
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stocks.count
  }
}


extension StockListViewController {
  
  private func fetchData() -> [Stock] {
    let stock1 = Stock(stockName: "Apple", companyIcon: Images.aaple)
    let stock2 = Stock(stockName: "Amazon", companyIcon: Images.amazon)
    let stock3 = Stock(stockName: "Google", companyIcon: Images.google)
    let stock4 = Stock(stockName: "Yandex", companyIcon: Images.yandex)
    let stock5 = Stock(stockName: "Star", companyIcon: Images.star)
    
    return [stock1, stock2, stock3, stock4, stock5]
    
  }
}



