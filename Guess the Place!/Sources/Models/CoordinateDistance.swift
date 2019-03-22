//
//  CoordinateDistance.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 22/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import Foundation
import CoreLocation

class CoordinateDistance {
  let value: Double
  
  init(firstCoordinate: CLLocationCoordinate2D, secondCoordinate: CLLocationCoordinate2D) {
    let firstLocation = CLLocation(latitude: firstCoordinate.latitude, longitude: firstCoordinate.longitude)
    let secondLocation = CLLocation(latitude: secondCoordinate.latitude, longitude: secondCoordinate.longitude)
    self.value = firstLocation.distance(from: secondLocation)
  }
}
