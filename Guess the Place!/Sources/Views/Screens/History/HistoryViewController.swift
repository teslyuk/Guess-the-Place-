//
//  HistoryViewController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 30/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  private var controller: HistoryController?
  
  convenience init(controller: HistoryController) {
    self.init()
    self.controller = controller
    self.controller?.viewController = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Decorator.decorate(self)
    setTabBarItem()
    delegating()
    registerCells()
    //addRightBarButton()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    controller?.viewWillAppear()
  }
  
//  private func addRightBarButton() {
//    let rightBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(clearHistory))
//    navigationItem.rightBarButtonItem = rightBarButton
//  }
//
//  @objc private func clearHistory() {
//    controller?.clearAttemps()
//  }
  
  func setTabBarItem() {
    let item = UITabBarItem(title: "История", image: UIImage.init(named: "clock"), tag: 1)
    self.tabBarItem = item
  }
  
  private func delegating() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  private func registerCells() {
    tableView.register(HistoryTableViewCell.nib, forCellReuseIdentifier: HistoryTableViewCell.name)
  }
}

extension HistoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 160
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return controller?.attemps.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.name, for: indexPath) as! HistoryTableViewCell
    let attemp = (controller?.attemps ?? [])[indexPath.row]
    cell.configure(by: attemp)
    return cell
  }
}

extension HistoryViewController: UITableViewDelegate {
  
}

private extension HistoryViewController {
  final class Decorator {
    private init() {}
    
    static func decorate(_ vc: HistoryViewController) {
      vc.navigationItem.title = "История попыток"
      vc.navigationItem.largeTitleDisplayMode = .always
      vc.navigationController?.navigationBar.prefersLargeTitles = true
      vc.tableView.separatorColor = .clear
    }
  }
}
