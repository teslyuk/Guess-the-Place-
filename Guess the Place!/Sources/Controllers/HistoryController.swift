//
//  HistoryController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 30/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import Foundation

final class HistoryController: NSObject, Lifecycable {
  private weak var realmInteractor: RealmInteractor?
  
  init(realmInteractor: RealmInteractor) {
    self.realmInteractor = realmInteractor
  }
}
