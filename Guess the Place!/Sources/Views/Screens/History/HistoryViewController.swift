//
//  HistoryViewController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 30/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
  
  private var controller: HistoryController?
  
  convenience init(controller: HistoryController) {
    self.init()
    self.controller = controller
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTabBarItem()
  }
  
  private func setTabBarItem() {
    let item = UITabBarItem(title: "История", image: #imageLiteral(resourceName: "clock.png"), tag: 1)
    self.tabBarItem = item
  }
  
}

private extension PanoramaViewController {
  final class Decorator {
    private init() {}
    
    static func decorate(_ vc: HistoryViewController) {
      vc.navigationItem.title = "История попыток"
      vc.navigationItem.largeTitleDisplayMode = .always
      vc.navigationController?.navigationBar.prefersLargeTitles = true
    }
  }
}
