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
  
  init (minDistance: UInt32, maxDistance: UInt32) {
    self.value = RandomCoords.generateRandomCoordinates(min: minDistance, max: maxDistance)
  }
  
  private static func generateRandomCoordinates(min: UInt32, max: UInt32) -> CLLocationCoordinate2D {
    //Get the Current Location's longitude and latitude
    let currentLong = 88.896770
    let currentLat = 32.351679
    
    //1 KiloMeter = 0.00900900900901° So, 1 Meter = 0.00900900900901 / 1000
    let meterCord = 0.00900900900901 / 1000
    
    //Generate random Meters between the maximum and minimum Meters
    let randomMeters = UInt(arc4random_uniform(max) + min)
    
    //then Generating Random numbers for different Methods
    let randomPM = arc4random_uniform(6)
    
    //Then we convert the distance in meters to coordinates by Multiplying number of meters with 1 Meter Coordinate
    let metersCordN = meterCord * Double(randomMeters)
    
    //here we generate the last Coordinates
    if randomPM == 0 {
      return CLLocationCoordinate2D(latitude: currentLat + metersCordN, longitude: currentLong + metersCordN)
    } else if randomPM == 1 {
      return CLLocationCoordinate2D(latitude: currentLat - metersCordN, longitude: currentLong - metersCordN)
    } else if randomPM == 2 {
      return CLLocationCoordinate2D(latitude: currentLat + metersCordN, longitude: currentLong - metersCordN)
    } else if randomPM == 3 {
      return CLLocationCoordinate2D(latitude: currentLat - metersCordN, longitude: currentLong + metersCordN)
    } else if randomPM == 4 {
      return CLLocationCoordinate2D(latitude: currentLat, longitude: currentLong - metersCordN)
    } else {
      return CLLocationCoordinate2D(latitude: currentLat - metersCordN, longitude: currentLong)
    }
    
  }
}
