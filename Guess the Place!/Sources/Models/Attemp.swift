//
//  Attemp.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 30/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import Foundation
import RealmSwift
import CoreLocation

class Attemp: Object {
  @objc dynamic var distance: Double = 0
  @objc dynamic var pickedCoordinateLatitude: Double = 0
  @objc dynamic var pickedCoordinateLongitude: Double = 0
  @objc dynamic var rightCoordinateLatitude: Double = 0
  @objc dynamic var rightCoordinateLongitude: Double = 0
  
  convenience init(distance: Double, pickedCoordinate: CLLocationCoordinate2D, rightCoordinagte: CLLocationCoordinate2D) {
    self.init()
    self.distance = distance
    self.pickedCoordinateLatitude = pickedCoordinate.latitude
    self.pickedCoordinateLongitude = pickedCoordinate.longitude
    self.rightCoordinateLatitude = rightCoordinagte.latitude
    self.rightCoordinateLongitude = rightCoordinagte.longitude
  }
  
  var pickedCoordinate: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: pickedCoordinateLatitude, longitude: pickedCoordinateLongitude)
  }
  
  var rightCoordinate: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: rightCoordinateLatitude, longitude: rightCoordinateLongitude)
  }
}
