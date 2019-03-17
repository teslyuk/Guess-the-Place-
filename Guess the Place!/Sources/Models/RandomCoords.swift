//
//  RandomCoords.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 15/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import Foundation
import CoreLocation

class RandomCoords {
  let value: CLLocationCoordinate2D
  
  private let arrayOfCoordinates = [
    CLLocationCoordinate2D(latitude: 55.809689, longitude: 37.554334),
    CLLocationCoordinate2D(latitude: 63.417582, longitude: -19.004353),
    CLLocationCoordinate2D(latitude: 43.645688, longitude: -79.378533),
    CLLocationCoordinate2D(latitude: -54.346515, longitude: -66.709404),
    CLLocationCoordinate2D(latitude: 37.460166, longitude: -122.162107),
    CLLocationCoordinate2D(latitude: 7.832160, longitude: 80.226570),
    CLLocationCoordinate2D(latitude: -18.447031, longitude: 48.050101),
    CLLocationCoordinate2D(latitude: -33.732798, longitude: 116.051693),
    CLLocationCoordinate2D(latitude: 38.483571, longitude: 141.298873),
    CLLocationCoordinate2D(latitude: -17.681098, longitude: -149.549660),
  ]
  
  init () {
    self.value = arrayOfCoordinates.randomElement()!
  }
}
