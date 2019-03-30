//
//  RealmInteractor.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 30/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmInteractor {
  func save(object: Object) {
    let realm = try! Realm()
    realm.add(object, update: true)
  }
  
  func fetchItems<T: Object>(ofType type: T.Type) -> [T] {
    let results = try! Realm().objects(type)
    let items = Array(results)
    return items
  }
}
