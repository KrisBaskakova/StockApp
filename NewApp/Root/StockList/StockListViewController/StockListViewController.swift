//
//  StockListVC.swift
//  NewApp
//
//  Created by Кристина Баскакова on 21.12.2022.
//

import UIKit

final class StockListViewController: UIViewController {
  
  weak var stockListPresenter: stockListPresenterProtocol!
  
  private let networkService = NetworkService()
  
  enum StocksListTableViewSectionType {
    case search
    case stocks
  }
  
  var tableViewModel: [StocksListTableViewSectionType] = [.search, .stocks]
  var stocks: [StockModel] = []
  
  private lazy var activityIndicator = UIActivityIndicatorView()
  private lazy var whiteView = UIView()
  private lazy var tableView = UITableView()
 
  private var lastContentOffset: CGFloat = 0
  
  //MARK: - Init and UI
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    setupActivityIndicator()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      let stocks = self.networkService.getStocks()
      self.activityIndicator.stopAnimating()
      self.activityIndicator.isHidden = true
      self.stocks = stocks
      self.registerCells()
      self.configureTableView()
    }
  }
  
  private func setupActivityIndicator() {
    view.addSubview(activityIndicator)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    activityIndicator.heightAnchor.constraint(equalToConstant: 44).isActive = true
    activityIndicator.widthAnchor.constraint(equalToConstant: 44).isActive = true
    activityIndicator.startAnimating()
  }
  
  private func registerCells() {
    tableView.separatorStyle = .none
    tableView.register(StockTableViewCell.self, forCellReuseIdentifier: "StockCell")
    tableView.register(StockListViewControllerHeader.self,         forHeaderFooterViewReuseIdentifier: "TableViewHeader")
    tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "searchCell")
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
      cell.set(model: stock)
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
  
  func tableView(_ tableView: UITableView,
                 didSelectRowAt indexPath: IndexPath
  ) {
    let stockDetailViewController = StockDetailViewController(stockModel: stocks[indexPath.row])
    self.navigationController?.pushViewController(stockDetailViewController, animated: true)
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

  
  //MARK: - ScrollView
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    var currentPosition: CGFloat = 0.0
    let header = tableView.headerView(forSection: 1) as? StockListViewControllerHeader
    
    if let tableView = scrollView as? UITableView {
      currentPosition = tableView.headerView(forSection: 1)?.frame.origin.y ?? 0.0
    }
   
    if currentPosition > 120.0 {
      header?.shadowView.backgroundColor = .white
      header?.shadowView.layer.shadowColor = UIColor.black.cgColor
      header?.shadowView.layer.shadowRadius = 9
      header?.shadowView.layer.shadowOpacity = 0.7
      header?.shadowView.layer.shadowOffset = CGSize(width: 3, height: 3)
      header?.whiteView.isHidden = false
    }
    else {
      header?.shadowView.layer.shadowColor = UIColor.white.cgColor
      header?.whiteView.isHidden = true
    }
  }

  //MARK: - Header
  
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

// MARK: - View extention
extension StockListViewController: stockListViewProtocol {
  func testAction() {
    print("ff")
  }
  
}
