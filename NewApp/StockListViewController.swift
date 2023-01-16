//
//  StockListVC.swift
//  NewApp
//
//  Created by Кристина Баскакова on 21.12.2022.
//

import UIKit

final class StockListViewController: UIViewController {
  
  enum StocksListTableViewSectionType {
    case search
    case stocks
  }
  
  var tableViewModel: [StocksListTableViewSectionType] = [.search, .stocks]
  
  private lazy var tableView = UITableView()
  private lazy var stocks: [Stock] = []
  private var lastContentOffset: CGFloat = 0
  
  //MARK: - Init
  
  override func viewDidLoad() {
    super.viewDidLoad()
    stocks = fetchData()
    tableView.separatorStyle = .none
    tableView.register(StockTableViewCell.self, forCellReuseIdentifier: "StockCell")
    tableView.register(StockListViewControllerHeader.self,         forHeaderFooterViewReuseIdentifier: "TableViewHeader")
    tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "searchCell")
    configureTableView()
  }
  
  
  func showSearchViewController() {
    let viewController = SearchViewController()
    viewController.modalPresentationStyle = .fullScreen
    present(viewController, animated: true)
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
    
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! SearchTableViewCell
      cell.didTapToSearchButtonClosure = { [weak self] in
        self?.showSearchViewController()
      }
      cell.selectionStyle = .none
      return cell
    case 1:
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
    default:
      return UITableViewCell()
    }
  }
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    
    switch section {
    case 0: return 1
    case 1: return stocks.count
    default:
      assertionFailure()
      return 0
    }
  }

  //pushing up
  func tableView(_ tableView: UITableView,
                 didEndDisplayingHeaderView view: UIView,
                 forSection section: Int) {

      //lets ensure there are visible rows.  Safety first!
      guard let pathsForVisibleRows = tableView.indexPathsForVisibleRows,
          let lastPath = pathsForVisibleRows.last else { return }

      //compare the section for the header that just disappeared to the section
      //for the bottom-most cell in the table view
      if lastPath.section >= section {
          print("test the next header is stuck to the top")
      }

  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    if let tableView = scrollView as? UITableView {
      


    let firstCount = tableView.headerView(forSection: 1)?.frame.origin.y

      
    }
    
  }

  //pulling down
  func tableView(_ tableView: UITableView,
                 willDisplayHeaderView view: UIView,
                 forSection section: Int) {

      //lets ensure there are visible rows.  Safety first!
      guard let pathsForVisibleRows = tableView.indexPathsForVisibleRows,
          let firstPath = pathsForVisibleRows.first else { return }

      //compare the section for the header that just appeared to the section
      //for the top-most cell in the table view
      if firstPath.section == section {
          print("test the previous header is stuck to the top")
      }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    switch section {
    case 0:
      return nil
      
    case 1:
      let headercell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewHeader") as! StockListViewControllerHeader
      return headercell
      
    default:
      return UIView()
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return tableViewModel.count
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForHeaderInSection section: Int
  ) -> CGFloat {
    guard let sectionType = tableViewModel[safe: section] else {
      assertionFailure()
      return 0
    }
    
    switch sectionType {
    case .search:
      return 0
    case .stocks:
      return 40
    }
  }
}



extension StockListViewController {
  
  private func fetchData() -> [Stock] {
    let stock1 = Stock(stockName: "Apple", companyIcon: Images.aaple)
    let stock2 = Stock(stockName: "Amazon", companyIcon: Images.amazon)
    let stock3 = Stock(stockName: "Google", companyIcon: Images.google)
    let stock4 = Stock(stockName: "Yandex", companyIcon: Images.yandex)
    let stock5 = Stock(stockName: "Star", companyIcon: Images.star)
    
    return [stock1, stock2, stock3, stock4, stock5, stock1, stock2, stock3, stock4, stock5, stock1, stock2, stock3, stock4, stock5, stock1, stock2, stock3, stock4, stock5, stock1, stock2, stock3, stock4, stock5, stock1, stock2, stock3, stock4, stock5]
    
  }
}
