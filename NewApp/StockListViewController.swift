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
  
  //MARK: - Init
  
  override func viewDidLoad() {
    super.viewDidLoad()
    stocks = fetchData()
    tableView.separatorStyle = .none
    tableView.register(StockTableViewCell.self, forCellReuseIdentifier: "StockCell")
    tableView.register(StockListViewControllerHeader.self, forHeaderFooterViewReuseIdentifier: "TableViewHeader")
    configureTableView()
  }

  func configureTableView() {
    view.addSubview(tableView)
    setTableViewDelegates()
    tableView.rowHeight = 76
    tableView.pin(to: view)
    tableView.sectionHeaderHeight = 50
  }
  
  func setTableViewDelegates() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    next?.touchesBegan(touches, with: event)
  }
  
}

//MARK: - Extension

extension StockListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
  
    let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell") as! StockTableViewCell
    let stock = stocks[indexPath.row]
    cell.set(stock: stock)
    cell.selectionStyle = .none
  
    if indexPath.row % 2 == 0 {
      cell.containerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    } else {
      cell.containerView.backgroundColor = UIColor(red: 0.941, green: 0.955, blue: 0.97, alpha: 1)
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stocks.count
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headercell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewHeader") as! StockListViewControllerHeader

    return headercell
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



