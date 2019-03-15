//
//  PanoramaController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 14/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import Foundation
import GoogleMaps

class PanoramaController: NSObject, Lifecycable {
  private weak var googleService: GoogleMapsService?
  weak var viewController: PanoramaViewController?
  
  var panoramaView: GMSPanoramaView? {
    return viewController?.panoramaView
  }
  
  init(googleService: GoogleMapsService) {
    self.googleService = googleService
  }
  
  func viewDidLoad() {
    let coords = RandomCoords(minDistance: 100, maxDistance: 25000).value
    panoramaView?.moveNearCoordinate(coords)
  }
}
