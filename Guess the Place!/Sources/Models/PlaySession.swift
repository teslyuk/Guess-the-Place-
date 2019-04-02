//
//  PlaySession.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 22/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import Foundation
import CoreLocation

final class PlaySession {
  private(set) var coordinate: CLLocationCoordinate2D?
  private(set) var isSessionActive: Bool = false
  
  func start(coordinate: CLLocationCoordinate2D) {
    self.coordinate = coordinate
    isSessionActive = true
  }
  
  func pick(point: CLLocationCoordinate2D) -> Result {
    guard let coordinate = coordinate else {
      return Result.error
    }
    
    let distance = CoordinateDistance(firstCoordinate: point, secondCoordinate: coordinate).value
    switch distance {
    case 0...1000:
      return Result.success(distance)
    default:
      return Result.failure(distance)
    }
  }
  
  func end() {
    coordinate = nil
    isSessionActive = false
  }
}

extension PlaySession {
  enum Result {
    case success(Double)
    case failure(Double)
    case error
  }
}
