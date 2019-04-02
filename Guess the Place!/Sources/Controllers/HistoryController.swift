//
//  HistoryController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 30/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import UIKit

final class HistoryController: NSObject, Lifecycable {
  private weak var realmInteractor: RealmInteractor?
  private(set) var attemps: [Attemp] = []
  
  weak var viewController: HistoryViewController?
  var tableView: UITableView? {
    return viewController?.tableView
  }
  
  init(realmInteractor: RealmInteractor) {
    self.realmInteractor = realmInteractor
  }
  
  func viewWillAppear() {
    loadAttemps() 
  }
  
  private func loadAttemps() {
    attemps = realmInteractor?.fetchItems(ofType: Attemp.self) ?? []
    tableView?.reloadData()
  }
  
  func clearAttemps() {
    realmInteractor?.removeItems(ofType: Attemp.self)
    tableView?.reloadData()
  }
}
